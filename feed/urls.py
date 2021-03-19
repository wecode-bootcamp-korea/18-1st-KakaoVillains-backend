from django.urls import path

from feed.views import FeedIndexView, FeedView, ReplyView, FeedLikeView


urlpatterns = [
    path('/feeds', FeedIndexView.as_view()),
    path('/<int:feed_id>', FeedView.as_view()),
    path('/reply', ReplyView.as_view()),
    path('/like/<int:feed_id>', FeedLikeView.as_view())
]