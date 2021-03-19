import json
from django.views    import View
from django.http    import JsonResponse

from.models           import Character, Category, SubCategory, Product, ProductImage, CharacterProduct, Review, ReviewLike
from account.models   import User
from utils.decorators import authenticator


class ProductDetail(View):
    def post(self, request):
        data           = json.loads(request.body)
        product_number = data.get('product_number')
        product        = Product.objects.get(pk=product_number)
        image_urls     = ProductImage.objects.filter(product_id=product_number)
        reviews        = Review.objects.filter(product_id=product_number)
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
    def Post(self, request):
        data    = json.loads(request.body)
        rating  = data.get('rating')
        content = data.get('content')
        product_info = data.get('product')
        product     = Post.objects.get(pk=product_info)

        Review.objects.create(user=request.user, product=product, rating=rating, content=content)


        pass