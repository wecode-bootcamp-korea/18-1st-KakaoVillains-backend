from django.db      import models

from account.models import User
from product.models import Product

class Feed(models.Model):
    user            = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    content         = models.TextField()
    reply_count     = models.Int(default=0)
    like_count      = models.Int(default=0)
    created_at      = models.DateTimeField(auto_now=False, auto_now_add=True)
    title = models.CharField(max_length=100)

    class Meta:
        db_table = 'feeds'

class FeedImage(models.Model):
    image_url = models.URLField(max_length=2000)
    feed      = models.ForeignKey(Feed, on_delete=models.SET_NULL, null=True)

    class Meta:
        db_table = 'feed_images'

class FeedLike(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL)
    feed = models.ForeignKey(Feed, on_delete=models.CASCADE)

    class Meta:
        db_table = 'feed_likes'


class Reply(models.Model):
    user       = models.ForeignKey(User, on_delete=models.SET_NULL)
    feed       = models.ForeignKey(Feed, on_delete=models.CASCADE)
    content    = models.TextField()
    like_count = models.Int(default=0)
    created_at = models.DateTimeField(auto_now=False, auto_now_add=True)
    reply      = models.ForeignKey('self', on_delete=models.CASCADE)

    class Meta:
        db_table = 'replies'

class ReplyLike(models.Model):
    reply = models.ForeignKey(Reply, on_delete=models.CASCADE)
    user  = models.ForeignKey(User, on_delete=models.SET_NULL)
    
    class Meta:
        db_table = 'reply_likes'

class RecommendedProduct(models.Model):
    feed    = models.ForeignKey(Feed, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)