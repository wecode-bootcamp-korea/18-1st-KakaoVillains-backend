from django.urls import path, include
from product.views import ProductDetail, ReviewManage

urlpatterns = [
    path('', ProductDetail.as_view()),
    path('/review', ReviewManage.as_view()),
]
