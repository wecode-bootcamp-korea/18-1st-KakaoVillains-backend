import json, bcrypt, jwt

from django.views     import View
from django.http      import JsonResponse
from json.decoder     import JSONDecodeError


from.models           import Character, Category, SubCategory, Product, ProductImage, CharacterProduct, Review, ReviewLike
from account.models   import User
from utils.decorators import authenticator, indicator
from my_settings      import SECRET_KEY



class ProductDetail(View):
    @indicator
    def get(self, request, product_id):
        try: 
            product        = Product.objects.get(pk=product_id)
            image_urls     = product.productimage_set.all()
            reviews        = product.review_set.all()
            image_list     = []
            review_list    = []

            image_list = [image_url.image_url for image_url in image_urls]

            for review in reviews:
                user = request.headers.get('Authorization')
                liked = False

                if token is None:
                    pass
                else:
                    decoded_token = jwt.decode(token, SECRET_KEY, algorithms='HS256')
                    user          = User.objects.get(pk=decoded_token['user_id'])
                    if ReviewLike.objects.filter(user=user, review=review).exists():
                        liked = True

                result_review = {
                    'id'         : review.pk,
                    'reviewer'   : review.user.username,
                    'rating'     : review.rating,
                    'created_at' : review.created_at.date(),
                    'content'    : review.content,
                    'like_count' : review.like_count,
                    'liked'      : liked
                }
                review_list.append(result_review)

            rating_value = float(product.average_rating)
            if rating_value % 1 < 0.3:
                rating_value = rating_value - (rating_value % 1)
            elif rating_value % 1 < 0.8:
                rating_value = rating_value - (rating_value % 1) + 0.5
            elif rating_value % 1 < 0.1:
                rating_value = rating_value - (rating_value % 1) + 1
            
            sub_category_relatives        = Product.objects.filter(sub_category=product.sub_category)
            character                     = product.character_set.first()
            character_relatives           = character.products.all()
            sub_category_related_products = [{"image_url":ProductImage.objects.filter(product=related_product).first().image_url, "name":related_product.name, "price":round(related_product.price), "discount_rate":related_product.discount_rate} for related_product in sub_category_relatives]
            character_related_products    = [{"image_url":ProductImage.objects.filter(product=related_product).first().image_url, "name":related_product.name, "price":round(related_product.price), "discount_rate":related_product.discount_rate} for related_product in character_relatives]
            temp                          = sub_category_related_products + character_related_products
            related_products              = []

            for related_product in temp:
                if related_product not in related_products:
                    related_products.append(related_product)


            results = [{
                'name'             : product.name,
                'price'            : round(product.price),
                'average_rating'   : rating_value,
                'description'      : product.description,
                'review_count'     : product.review_count,
                'image_list'       : image_list,
                'review_list'      : review_list,
                'related_products' : related_products
            }]

            return JsonResponse({'result': results}, status=200)
        except Product.DoesNotExist:
            return JsonResponse({"message":"Product_DoesNotExist"}, status=404)


class ReviewManage(View):
    @authenticator
    def post(self, request):
        try: 
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
                review_count   = review_count + 1
            )

            return JsonResponse({'result': 'Review Created'}, status=201)
        except TypeError:
            return JsonResponse({"message":"Type_Error"}, status=400)
        except Product.DoesNotExist:
            return JsonResponse({"message":"Product_DoesNotExist"}, status=404)


class ReviewLikeManage(View):
    @authenticator
    def post(self, request):
        try:
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
        except Review.DoesNotExist:
            return JsonResponse({"message": "Review_DoesNotExist"}, status=404)
        except JSONDecodeError:
            return JsonResponse({'message': 'JSON_DECODE_ERROR'}, status=400)


class CategoryManage(View):
    def get(self, request, filter_type):
        try:
            categorySeq = request.GET.get('categorySeq', None)
            subCategorySeq = request.GET.get('subCategorySeq', None)
            characterSeq = request.GET.get('characterSeq', None)
            sort = request.GET.get('sort', None)
            if sort not in ["creatDatetime,desc", "salePrice,asc", "salePrice,desc"]:
                return JsonResponse({"message":"sort is not valid"}, status=400)

            def character_filter(character_id):
                character = Character.objects.get(pk=character_id)
                if sort == "creatDatetime,desc":
                    product_list = character.products.all().order_by('-created_at')
                elif sort == "salePrice,asc":
                    product_list = character.products.all().order_by('price')
                elif sort == "salePrice,desc":
                    product_list = character.products.all().order_by('-price')
                return product_list
            
            def sub_category_filter(sub_category_id, character_id):
                sub_category = SubCategory.objects.get(pk=sub_category_id)
                if character_id is None:
                    if sort == "creatDatetime,desc":
                        product_list = Product.objects.filter(sub_category=sub_category).order_by('-created_at')
                    elif sort == "salePrice,asc":
                        product_list = Product.objects.filter(sub_category=sub_category).order_by('price')
                    elif sort == "salePrice,desc":
                        product_list = Product.objects.filter(sub_category=sub_category).order_by('-price')
                else:
                    character = Character.objects.get(pk=character_id)
                    filtered_products = Product.objects.filter(sub_category=sub_category)
                    character_products = character.products.all()
                    product_list = []
                    for filtered_product in filtered_products:
                        if filtered_product in character_products:
                            product_list.append(filtered_product)
                    if sort == "creatDatetime,desc":
                        product_list.sort(key=lambda x: x.created_at, reverse=True)
                    elif sort == "salePrice,asc":
                        product_list.sort(key=lambda x: x.price)
                    elif sort == "salePrice,desc":
                        product_list.sort(key=lambda x: x.price, reverse=True)
                return product_list
            
            def category_filter(category_id, character_id):
                sub_categories = SubCategory.objects.filter(category_id=category_id)
                product_list = []
                if character_id is None:
                    for sub_category in sub_categories:
                        products = sub_category.product_set.all()
                        for product in products:
                            product_list.append(product)
                        # product_list = [product for product in products]         # sub_category 값 하나만 들어오는데 왜인지 모르겠어요
                    if sort == "creatDatetime,desc":
                        product_list.sort(key=lambda x: x.created_at, reverse=True)
                    elif sort == "salePrice,asc":
                        product_list.sort(key=lambda x: x.price)
                    elif sort == "salePrice,desc":
                        product_list.sort(key=lambda x: x.price, reverse=True)
                    return product_list

                else:
                    character = Character.objects.get(pk=character_id)
                    character_products = character.products.all()
                    for sub_category in sub_categories:
                        products = sub_category.product_set.all()
                        for product in products:
                            if product in character_products:
                                product_list.append(product)
                        # product_list = [products for product in products if product in character_products]  # 안되는데 왜인지 모르겠어요
                    if sort == "creatDatetime,desc":
                        product_list.sort(key=lambda x: x.created_at, reverse=True)
                    elif sort == "salePrice,asc":
                        product_list.sort(key=lambda x: x.price)
                    elif sort == "salePrice,desc":
                        product_list.sort(key=lambda x: x.price, reverse=True)
                    return product_list

            def generator(products):
                product_list  = []
                for product in products:
                    image_url = ProductImage.objects.filter(product=product).first().image_url
                    if image_url is None:
                        image_url = ""
                    product_dict = {
                        "product_id"    : product.pk,
                        "image_url"     : image_url,
                        "name"          : product.name,
                        "price"         : round(product.price),
                        "discount_rate" : product.discount_rate
                    }
                    product_list.append(product_dict)
                return(product_list)
        
            if (characterSeq is None) and (categorySeq is None) and (subCategorySeq is None):
                if sort == "creatDatetime,desc":
                    product_list  = []
                    products = Product.objects.all().order_by('-created_at')
                    result = {
                        "character_name" : "전체",
                        "character_id"   : "0",
                        "product"        : generator(products)
                    }
                    return JsonResponse({'result': result}, status=200)
                
                elif sort == "salePrice,asc":
                    product_list  = []
                    products = Product.objects.all().order_by('price')
                    result = {
                        "character_name" : "전체",
                        "character_id"   : "0",
                        "product"        : generator(products)
                    }
                    return JsonResponse({'result': result}, status=200)

                elif sort == "salePrice,desc":
                    product_list  = []
                    products = Product.objects.all().order_by('-price')
                    result = {
                        "character_name" : "전체",
                        "character_id"   : "0",
                        "product"        : generator(products)
                    }
                    return JsonResponse({'result': result}, status=200)

            if filter_type == "character":
                result = {
                    "character_name" : Character.objects.get(pk=characterSeq).name,
                    "character_id"   : Character.objects.get(pk=characterSeq).pk,
                    "product"        : generator(character_filter(characterSeq))
                }
                return JsonResponse({'result': result}, status=200)

            if filter_type == "subject":
                if subCategorySeq is None:
                    result = {
                        "category_name"     : Category.objects.get(pk=categorySeq).name,
                        "category_id"       : Category.objects.get(pk=categorySeq).pk,
                        "sub_category_name" : [sub_category.name for sub_category in SubCategory.objects.filter(category=categorySeq)],
                        "product"           : generator(category_filter(categorySeq, characterSeq))
                    }
                    return JsonResponse({'result': result}, status=200)

                else:
                    result = {
                        "category_name"     : SubCategory.objects.get(pk=subCategorySeq).category.name,
                        "category_id"       : SubCategory.objects.get(pk=subCategorySeq).category.pk,
                        "sub_category_name" : [sub_category.name for sub_category in SubCategory.objects.filter(category=SubCategory.objects.get(pk=subCategorySeq).category)],
                        "product"           : generator(sub_category_filter(subCategorySeq, characterSeq))
                    }
                    return JsonResponse({'result': result}, status=200)
              
            else:
                return JsonResponse({"message":"Forbidden access"}, status=403)
                
        except AttributeError:
            return JsonResponse({"message": "Attribute_Error"}, status=404)
        except Character.DoesNotExist:
            return JsonResponse({"message": "Character_DoesNotExist"}, status=404)
        except Category.DoesNotExist:
            return JsonResponse({"message": "Category_DoesNotExist"}, status=404)
        except SubCategory.DoesNotExist:
            return JsonResponse({"message": "SubCategory_DoesNotExist"}, status=404)


class SearchManage(View):
    def get(self, request):
        try:
            keyword   = request.GET.get('keyword', None)
            sort      = request.GET.get('sort', None)
            character = request.GET.get('character', None)
            if keyword == "":
                return JsonResponse({"message": "keyword is empty"}, status=404)
            else:
                name_searched_products = Product.objects.filter(name__contains=keyword)
                if sort is None:
                    result = []
                    result = [{"product_name" : product.name, "product_id" : product.pk} for product in name_searched_products]
                else:
                    categories_searched     = Category.objects.filter(name__contains=keyword)
                    sub_categories_searched = SubCategory.objects.filter(name__contains=keyword)

                    searched_products = []
                    products          = []
                    for sub_category in sub_categories_searched:
                        sub_category_searched_products = sub_category.product_set.all()
                        for product in sub_category_searched_products:
                            searched_products.append(product)

                    for category in categories_searched:
                        sub_categories = SubCategory.objects.filter(category=category)
                        for sub_category in sub_categories:
                            category_searched_products = sub_category.product_set.all()
                            for product in category_searched_products:
                                searched_products.append(product)

                    for product in name_searched_products:
                        searched_products.append(product)
                    
                    for product in searched_products:
                        if product not in products:
                            products.append(product)

                    if character:  
                        temps = []     
                        for product in products:
                            if product.character_set.first().id == int(character):
                                temps.append(product)
                        products = temps

                    if sort == "NEW":
                        products.sort(key=lambda x: x.created_at, reverse=True)
                    elif sort == "PRICE_ASC":
                        products.sort(key=lambda x: x.price)
                    elif sort == "PRICE_DESC":
                        products.sort(key=lambda x: x.price, reverse=True)
                    else:
                        return JsonResponse({"message": "sort is not valid"}, status=400)
                    result = [{"image_url":ProductImage.objects.filter(product=product).first().image_url, "product_name" : product.name, "product_id" : product.pk, "price":product.price, "discount_rate":product.discount_rate} for product in products]
                return JsonResponse({'result': result}, status=200)
        
        except ValueError:
            return JsonResponse({"message": "Value_Error"}, status=403)