from django.db import models

class User(models.Model):
    username            = models.CharField(max_length=45)
    password            = models.CharField(max_length=1000)
    admin               = models.BooleanField(default=False)
    profile_picture_url = models.URLField(max_length=2000, null=True)
    created_at          = models.DateTimeField(auto_now_add=True)
    email               = models.EmailField(max_length=254, unique=True)
    liked_feed             = models.ManyToManyField(
        'feed.Feed',
        through='feed.FeedLike',
        related_name='liked_user'
    )

    class Meta:
        db_table = 'users'