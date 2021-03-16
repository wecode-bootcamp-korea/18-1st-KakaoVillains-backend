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
    card_number = models.CharField(max_length=45)
    expiration  = models.CharField(max_length=45)
    cvc         = models.CharField(max_length=3)
    user        = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    default     = models.BooleanField(default=False)

    class Meta:
        db_table = 'credit_cards'


class Transaction(models.Model):
    user        = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    address     = models.ForeignKey(Address, on_delete=models.SET_NULL, null=True)
    credit_card = models.ForeignKey(CreditCard, on_delete=models.SET_NULL, null=True)
    created_at  = models.DateTimeField(auto_now=False, auto_now_add=True)
    status      = models.CharField(max_length=45, default='Payment in progress')
    
    class Meta:
        db_table = 'transactions'

"""
Transaction Status:
    1. Payment in progress: 결제 중
    2. Paid: 결제 완료
    3. Shipment in progress: 배송 준비 중
    4. Shiped: 배송 중
    5. Delivered: 배송 완료
"""

class PurchasedProduct(models.Model):
    product     = models.ForeignKey(Product, on_delete=models.SET_NULL, null=True)
    transaction = models.ForeignKey(Transaction, on_delete=models.SET_NULL, null=True)
    quantity    = models.IntegerField(default=1)

    class Meta:
        db_table = 'purchased_products'