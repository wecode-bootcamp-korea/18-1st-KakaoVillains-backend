import json
from django.views    import View
from django.http    import JsonResponse

from.models           import Character, Category, SubCategory, Product, ProductImage, CharacterProduct, Review, ReviewLike
from account.models   import User
from utils.decorators import authenticator


class ProductDetail(View):
    def get(self, request, product_id):
        product        = Product.objects.get(pk=product_id)
        image_urls     = ProductImage.objects.filter(product_id=product_id)
        reviews        = Review.objects.filter(product_id=product_id)
        image_list     = []
        review_list    = []
        

        for image_url in image_urls:
            image_list.append(image_url.image_url)

        for review in reviews:
            result_review = {
                'id'         : review.pk,
                'reviewer'   : review.user.username,
                'rating'     : review.rating,
                'created_at' : review.created_at.date(),
                'content'    : review.content,
                'like_count' : review.like_count
            }
            review_list.append(result_review)
        
        results = [{
            'name'           : product.name,
            'price'          : product.price,
            'average_rating' : product.average_rating,
            'description'    : product.description,
            'review_count'   : product.review_count,
            'image_list'     : image_list,
            'review_list'    : review_list
        }]

        return JsonResponse({'result': results}, status=200)

class ReviewManage(View):
    @authenticator
    def post(self, request):
        data         = json.loads(request.body)
        rating       = data.get('rating')
        content      = data.get('content')
        product_info = data.get('product_id')
        product      = Product.objects.get(pk=product_info)

        Review.objects.create(user=request.user, product=product, rating=rating, content=content)
        
        average_rating = product.average_rating
        review_count   = product.review_count

        Product.objects.filter(pk=product.id).update(
            average_rating = (average_rating * review_count + rating) / (review_count + 1),
            review_count = review_count + 1
        )

        return JsonResponse({'result': 'Review Created'}, status=201)

class ReviewLikeManage(View):
    @authenticator
    def post(self, request):
        data         = json.loads(request.body)
        review_info  = data.get('review_id')
        review       = Review.objects.get(pk=review_info)
        count        = review.like_count

        if ReviewLike.objects.filter(user=request.user, review=review).exists():
            ReviewLike.objects.filter(user=request.user, review=review).delete()
            Review.objects.filter(pk=review.id).update(like_count=count-1)
            return JsonResponse({'result': 'Unliked'}, status=201)

        
        else:
            ReviewLike.objects.create(user=request.user, review=review)
            Review.objects.filter(pk=review.id).update(like_count=count+1)
            return JsonResponse({'result': 'liked'}, status=201)

class CategoryManage(View):
    def get(self, request):
        product        = Product.objects.get(pk=product_id)
        image_urls     = ProductImage.objects.filter(product_id=product_id)
        reviews        = Review.objects.filter(product_id=product_id)
        image_list     = []
        review_list    = []
        

        for image_url in image_urls:
            image_list.append(image_url.image_url)

        for review in reviews:
            result_review = {
                'id'         : review.pk,
                'reviewer'   : review.user.username,
                'rating'     : review.rating,
                'created_at' : review.created_at.date(),
                'content'    : review.content,
                'like_count' : review.like_count
            }
            review_list.append(result_review)
        
        results = [{
            'name'           : product.name,
            'price'          : product.price,
            'average_rating' : product.average_rating,
            'description'    : product.description,
            'review_count'   : product.review_count,
            'image_list'     : image_list,
            'review_list'    : review_list
        }]

        return JsonResponse({'result': results}, status=200)
