from django.db import models

from account.models import User

class Character(models.Model):
    name     = models.CharField(max_length=45, unique=True)
    products = models.ManyToManyField('Product', through='CharacterProduct')

    class Meta:
        db_table = 'characters'

class Category(models.Model):
    name    = models.CharField(max_length=45, unique=True)

    class Meta:
        db_table = 'categories'

class SubCategory(models.Model):
    name     = models.CharField(max_length=45, unique=True)
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)

    class Meta:
        db_table = 'sub_categories'

class Product(models.Model):
    name           = models.CharField(max_length=45)
    price          = models.DecimalField(max_digits=10, decimal_places=2)
    average_rating = models.DecimalField(max_digits=2, decimal_places=1, default=0)
    review_count   = models.IntegerField(default=0)
    sub_category   = models.ForeignKey(SubCategory, on_delete=models.SET_NULL, null=True)
    discount_rate  = models.DecimalField(max_digits=3, decimal_places=1, default=0)
    updated_at     = models.DateTimeField(auto_now=True)
    description    = models.TextField(null=True)
    created_at     = models.DateTimeField(auto_now_add=True)
    sell_count     = models.IntegerField(default=0)
    category       = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)
    
    class Meta:
        db_table = 'products'

class ProductImage(models.Model):
    image_url = models.URLField(max_length=2000)
    product   = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        db_table = 'product_images'


class CharacterProduct(models.Model):
    character = models.ForeignKey(Character, on_delete=models.CASCADE)
    product   = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        db_table = 'characters_products'


class Review(models.Model):
    user       = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    product    = models.ForeignKey(Product, on_delete=models.CASCADE)
    rating     = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    like_count = models.IntegerField(default=0)
    content    = models.TextField()

    class Meta:
        db_table = 'reviews'

class ReviewLike(models.Model):
    user   = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    review = models.ForeignKey(Review, on_delete=models.CASCADE)

    class Meta:
        db_table = 'review_likes'