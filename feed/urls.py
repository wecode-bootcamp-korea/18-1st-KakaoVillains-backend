from django.urls import path

from feed.views import FeedIndexView, FeedView, ReplyView


urlpatterns = [
    path('/feeds', FeedIndexView.as_view()),
    path('/<int:feed_id>', FeedView.as_view()),
    path('/reply', ReplyView.as_view())
]