from django.urls import path, include
from product.views import ProductDetail, ReviewManage, ReviewLikeManage, CategoryManage

urlpatterns = [
    path('/<int:product_id>', ProductDetail.as_view()),
    path('/review', ReviewManage.as_view()),
    path('/like', ReviewLikeManage.as_view()),
    path('/category' CategoryManage.as_view()),
]
