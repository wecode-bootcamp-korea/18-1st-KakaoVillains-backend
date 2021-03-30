import os
import django
import csv
import sys
import bcrypt

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "kakaovillains.settings")
django.setup()

from account.models import *
from feed.models import *
from product.models import *

# 유저 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains_db/Character.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
#         Character.objects.create(name=row[1])


# 유저 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains_db/User.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
        # User.objects.create(username=row[1], password=bcrypt.hashpw(row[2].encode('utf-8'), bcrypt.gensalt()).decode('utf-8'), admin=row[3], profile_picture_url=row[4], email=row[6])

# 카테고리 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains.csv/Category.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
#         Category.objects.create(name=row[1])

# # 서브카테고리 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains.csv/SubCategory.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
#         SubCategory.objects.create(name=row[1], category_id=int(row[2]))


# # 피드 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains.csv/Feed.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
        # Feed.objects.create(user_id=int(row[1]), content=row[2],reply_count=int(row[3]), like_count=int(row[4]),created_at=row[5],  title=row[6])

# # 피드 이미지 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains.csv/FeedImage.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
#         FeedImage.objects.create(feed_id=int(row[1]), image_url=row[2])

# # product 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains.csv/Product.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
#         Product.objects.create(name=row[1], price=row[2], sub_category_id=int(row[5]), category_id=int(row[6]), description=row[10], created_at=row[11], average_rating=row[3], review_count=row[4], )

# # character product 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains.csv/CharacterProduct.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
#         CharacterProduct.objects.create(character_id=int(row[1]), product_id=int(row[2]))

# # 댓글 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains.csv/Reply.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
#         Reply.objects.create(user_id=int(row[1]), feed_id=int(row[2]), content=row[3], like_count=row[4], created_at=row[5])

# # 리뷰 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains.csv/Review.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
#         Review.objects.create(user_id=int(row[1]), product_id=int(row[2]), rating=int(row[3]), content=row[6], created_at=row[4], like_count=row[5])

# # # 추천 상품 업로드
# CSV_PATH_PRODUCTS = 'kakaovillains.csv/RecommendedProduct.csv'

# with open(CSV_PATH_PRODUCTS) as file:
#     data_reader = csv.reader(file)
#     next(file)
#     for row in data_reader:
#         RecommendedProduct.objects.create(feed_id=int(row[1]), product_id=int(row[2]))

# # # 추천 상품 업로드
CSV_PATH_PRODUCTS = 'kakaovillains.csv/ProductImage.csv'
des
with open(CSV_PATH_PRODUCTS) as file:
    data_reader = csv.reader(file)
    next(file)
    for row in data_reader:
        ProductImage.objects.create(image_url=row[1], product_id=int(row[2]))
