import json

from django.views     import View
from django.http      import JsonResponse
from django.db.models import Q
from django.core      import exceptions

from feed.models    import Feed, FeedImage, Reply
from account.models import User
from product.models import Product, ProductImage


class FeedIndexView(View):
    def get(self, request):
        feeds       = Feed.objects.all()
        feed_images = FeedImage.objects.all()

        result = []
        for feed in feeds:
            image_urls         = FeedImage.objects.filter(feed_id=feed.id)
            image_url          = [element.image_url for element in image_urls]
            user               = User.objects.get(id=feed.user_id)
            reply              = Reply.objects.filter(feed_id=feed.id, parent_id=None).order_by('created_at').last()
            recommend_products = Feed.objects.get(id=feed.id).products.all()
            
            if not reply:
                reply_username = ''
                reply_content  = ''
            else:
                reply_username = reply.user.username
                reply_content  = reply.content            

            if not recommend_products:
                recommend_product = []
            else:
                recommend_product = []
                for product in recommend_products:
                    product_dict = {
                        'name'      : product.name,
                        'price'     : product.price,
                        'image_url' : product.productimage_set.first().image_url
                    }
                    recommend_product.append(product_dict)

            my_dict = {
                'id'                 : feed.id,
                'username'           : user.username,
                'title'              : feed.title,
                'content'            : feed.content,
                'image_url'          : image_url,
                'profile_picture'    : user.profile_picture_url,
                'like_count'         : feed.like_count,
                'datetime'           : feed.created_at,
                'reply_count'        : feed.reply_count,
                'reply_username'     : reply_username,
                'reply'              : reply_content,
                'recommend_products' : recommend_product,
            }

            result.append(my_dict)

        return JsonResponse({'result' : result}, status=200)

class FeedView(View):
    def get(self, request, feed_id):
        try:
            feed        = Feed.objects.get(id=feed_id)
            feed_images = FeedImage.objects.filter(feed_id=feed.id)
            image_url   = [element.image_url for element in feed_images]
            replies     = feed.reply_set.all()

            reply_list = []
            reply_of_reply_list = []
            for reply in replies:
                if not reply.parent_id:
                    reply_dict = {
                        'id'             : reply.id,
                        'reply'          : reply.content,
                        'reply_username' : reply.user.username,
                        'like_count'     : reply.like_count,
                    }
                    reply_list.append(reply_dict)
                
                if reply.parent_id:
                    reply_of_reply_dict = {
                        'id'             : reply.id,
                        'reply'          : reply.content,
                        'reply_username' : reply.user.username,
                        'like_count'     : reply.like_count,
                        'reply_id'       : reply.parent_id
                    }
                    reply_of_reply_list.append(reply_of_reply_dict)

            result = []

            my_dict = {
                'id'              : feed.id,
                'username'        : feed.user.username,
                'title'           : feed.title,
                'content'         : feed.content,
                'image_url'       : image_url,
                'profile_picture' : feed.user.profile_picture_url,
                'like_count'      : feed.like_count,
                'reply_count'     : feed.reply_count,
                'reply'           : reply_list,
                'reply_of_reply'  : reply_of_reply_list

            }
            result.append(my_dict)

            return JsonResponse({'result' : result}, status=200)

        except json.JSONDecodeError:
            return JsonResponse({'message': 'JSON_DECODE_ERROR'}, status=400)

        except Feed.DoesNotExist:
            return JsonResponse({'message': 'INVALID FEED_ID'}, status=400)
