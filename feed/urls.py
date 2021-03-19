from django.urls import path

from feed.views import FeedIndexView, FeedView


urlpatterns = [
    path('/feeds', FeedIndexView.as_view()),
    path('/<int:feed_id>', FeedView.as_view())
]