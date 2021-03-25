import json

from django.views     import View
from django.http      import JsonResponse
from django.db.models import Q
from django.core      import exceptions

from feed.models      import Feed, FeedImage, Reply, FeedLike, ReplyLike
from account.models   import User
from product.models   import Product, ProductImage
from utils.decorators import authenticator, indicator


def reply(feed_id):
    reply = Feed.objects.get(id=feed_id).reply_set.filter(parent_id=None).order_by('-created_at').first()
    return reply

class FeedIndexView(View):
    @indicator
    def get(self, request):
        PAGE   = int(request.GET.get('page'))
        ITEM   = 4
        OFFSET = ITEM * PAGE
        LIMIT  = OFFSET + ITEM

        
        if OFFSET > Feed.objects.all().count():
            return JsonResponse({'message': 'SUCCSESS'}, status=200)

        feeds = Feed.objects.all().order_by('-created_at')[OFFSET:LIMIT]
        
        result = [
            {
                'id'                 : feed.id,
                'username'           : feed.user.username,
                'title'              : feed.title,
                'content'            : feed.content,
                'image_url'          : [element.image_url for element in feed.feedimage_set.all()],
                'profile_picture'    : feed.user.profile_picture_url,
                'like_count'         : feed.like_count,
                'datetime'           : feed.created_at.strftime('%Y.%m.%d'),
                'heart'              : request.user.feedlike_set.filter(feed_id=feed.id).exists() if request.user else False,
                'reply_count'        : feed.reply_count,
                'reply_username'     : reply(feed.id).user.username if reply(feed.id) else '',
                'reply_content'      : reply(feed.id).content if reply(feed.id) else '',
                'recommend_products' : [
                                            {
                                                'id'        : product.id,
                                                'name'      : product.name,
                                                'price'     : round(product.price),
                                                'image_url' : product.productimage_set.first().image_url
                                            } for product in feed.products.all()
                                        ]
            } for feed in feeds
        ]

        return JsonResponse({'result' : result}, status=200)

class FeedView(View):
    @indicator
    def get(self, request, feed_id):
        try:
            feed    = Feed.objects.get(id=feed_id)
            replies = feed.reply_set.all().order_by('-created_at')

            result = {
                'id'                : feed.id,
                'username'          : feed.user.username,
                'title'             : feed.title,
                'content'           : feed.content,
                'image_url'         : [element.image_url for element in feed.feedimage_set.all()],
                'profile_picture'   : feed.user.profile_picture_url,
                'heart'             : request.user.feedlike_set.filter(feed_id=feed.id).exists() if request.user else False,
                'like_count'        : feed.like_count,
                'reply_count'       : feed.reply_count,
                'recommend_products': [
                                            {
                                                'id'       : product.id,
                                                'name'     : product.name,
                                                'price'    : round(product.price),
                                                'image_url': product.productimage_set.first().image_url
                                            } for product in feed.products.all()
                                        ],
                'reply'             : [
                                            {
                                                'id'            : reply.id,
                                                'reply_content' : reply.content,
                                                'reply_username': reply.user.username,
                                                'like_count'    : reply.like_count,
                                                'reply_id'      : reply.parent_id,
                                                'datetime'      : reply.created_at.strftime('%Y-%m-%d'),
                                                'heart'         : request.user.replylike_set.filter(reply_id=reply.id).exists() if request.user else False
                                            } for reply in replies
                                        ]
            }

            return JsonResponse({'result' : result}, status=200)

        except json.JSONDecodeError:
            return JsonResponse({'message': 'JSON_DECODE_ERROR'}, status=400)

        except Feed.DoesNotExist:
            return JsonResponse({'message': 'INVALID FEED_ID'}, status=400)

class ReplyView(View):
    @authenticator
    def post(self, request):
        try:
            data      = json.loads(request.body)
            feed_id   = request.GET.get('feed_id')
            parent_id = request.GET.get('parent_id')
            feed      = Feed.objects.get(id=feed_id)
            
            if not data.get('content'):
                return JsonResponse({'message': 'Type content'}, status=400)

            Reply.objects.create(content=data['content'], feed_id=feed_id, parent_id=parent_id, user_id=request.user.id)

            if not parent_id:
                feed.reply_count += 1
                feed.save()

            return JsonResponse({'message': 'SUCCSESS'}, status=201)

        except json.JSONDecodeError:    
            return JsonResponse({'message': 'JSON_DECODE_ERROR'}, status=400)
        
        except Feed.DoesNotExist:
            return JsonResponse({'message': 'INVALID_FEED'}, status=400)

    @authenticator
    def delete(self, request):
        try:
            reply = Reply.objects.get(id=request.GET.get('reply_id'), user_id=request.user)
            feed  = reply.feed

            if not reply.parent_id:
                feed.reply_count -= 1
                feed.save()

            reply.delete()

            return JsonResponse({'message': 'SUCCESS'}, status=204)

        except Reply.DoesNotExist:
            return JsonResponse({'message': 'INVALID_REPLY'}, status=400)

    @authenticator
    def patch(self, request):
        try:
            data     = json.loads(request.body)
            reply    = Reply.objects.get(id=request.GET.get('reply_id'), user_id=request.user.id)
            
            if not data.get('content'):
                return JsonResponse({'message': 'Type content'}, status=400)
            
            reply.content = data['content']
            reply.save()

            return JsonResponse({'message': 'SUCCESS'}, status=200)

        except json.JSONDecodeError:    
            return JsonResponse({'message': 'JSON_DECODE_ERROR'}, status=400)

        except Reply.DoesNotExist:
            return JsonResponse({'message': 'INVALID_REPLY'}, status=400)

class FeedLikeView(View):
    @authenticator    
    def post(self, request, feed_id):
        try:
            feed      = Feed.objects.get(id=feed_id)
            feed_like = feed.feedlike_set.filter(feed_id=feed_id, user_id=request.user.id).exists()

            if feed_like:
                feed.feedlike_set.get(feed_id=feed_id, user_id=request.user.id).delete()
                feed.like_count -= 1
                feed.save()
            else:
                FeedLike.objects.create(feed_id=feed.id, user_id=request.user.id)
                feed.like_count += 1
                feed.save()

            result = {
                'like_count' : feed.like_count,
                'heart'      : feed.feedlike_set.filter(feed_id=feed.id, user_id=request.user.id).exists()
            }

            return JsonResponse({'result': result}, status=201)

        except Feed.DoesNotExist:
            return JsonResponse({'message': 'INVALID FEED_ID'}, status=400)

        except Feed.MultipleObjectsReturned:
            return JsonResponse({'message': 'INVALID FEED_ID'}, status=400)

class ReplyLikeView(View):
    @authenticator
    def post(self, request, reply_id):
        try:
            reply      = Reply.objects.get(id=reply_id)
            reply_like = reply.replylike_set.filter(user_id=request.user.id, reply_id=reply_id).exists()

            if reply_like:
                reply.replylike_set.get(user_id=request.user.id, reply_id=reply_id).delete()
                reply.like_count -= 1
                reply.save()
            else:
                ReplyLike.objects.create(user_id=request.user.id, reply_id=reply_id)
                reply.like_count += 1
                reply.save()

            return JsonResponse({'like_count': reply.like_count}, status=201)

        except json.JSONDecodeError:    
            return JsonResponse({'message': 'JSON_DECODE_ERROR'}, status=400)

        except Reply.DoesNotExist:
            return JsonResponse({'message': 'INVALID REPLY_ID'}, status=400)