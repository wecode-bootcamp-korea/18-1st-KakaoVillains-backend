from django.urls import path

from feed.views import FeedIndexView


urlpatterns = [
    path('/feedindex', FeedIndexView.as_view()),
    # path('/feed', FeedView.as_view())
]