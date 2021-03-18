from django.db import models

from account.models import User
from product.models import Product

class Cart(models.Model):
    user     = models.ForeignKey(User, on_delete=models.CASCADE)
    product  = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)

    class Meta:
        db_table = 'carts'


class Address(models.Model):
    user             = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    name             = models.CharField(max_length=45)
    phone_number     = models.CharField(max_length=45)
    address          = models.CharField(max_length=45)
    detailed_address = models.CharField(max_length=45)
    request          = models.CharField(max_length=200, null=True)
    default          = models.BooleanField(default=False)
    zipcode          = models.CharField(max_length=5)

    class Meta:
        db_table = 'addresses'


class CreditCard(models.Model):
    name        = models.CharField(max_length=45)
    card_number = models.CharField(max_length=2000)
    expiration  = models.CharField(max_length=45)
    user        = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    default     = models.BooleanField(default=False)

    class Meta:
        db_table = 'credit_cards'


class Transaction(models.Model):
    user        = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    address     = models.ForeignKey(Address, on_delete=models.SET_NULL, null=True)
    credit_card = models.ForeignKey(CreditCard, on_delete=models.SET_NULL, null=True)
    created_at  = models.DateTimeField(auto_now_add=True)
    status      = models.ForeignKey('Status', on_delete=models.SET_NULL, null=True)
    products    = models.ManyToManyField(Product, through='PurchasedProduct')
    
    class Meta:
        db_table = 'transactions'

class Status(models.Model):
    condition   = models.CharField(max_length=45)

    class Meta:
        db_table = 'statuses'

class PurchasedProduct(models.Model):
    product     = models.ForeignKey(Product, on_delete=models.SET_NULL, null=True)
    transaction = models.ForeignKey(Transaction, on_delete=models.SET_NULL, null=True)
    quantity    = models.IntegerField(default=1)

    class Meta:
        db_table = 'purchased_products'