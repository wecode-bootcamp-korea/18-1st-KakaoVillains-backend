from django.urls import path

from feed.views import FeedIndexView, FeedView, ReplyView, FeedLikeView, ReplyLikeView


urlpatterns = [
    path('/feeds', FeedIndexView.as_view()),
    path('/<int:feed_id>', FeedView.as_view()),
    path('/reply', ReplyView.as_view()),
    path('/like/feed/<int:feed_id>', FeedLikeView.as_view()),
    path('/like/reply/<int:reply_id>', ReplyLikeView.as_view())
]