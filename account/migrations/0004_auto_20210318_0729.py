# Generated by Django 3.1.7 on 2021-03-18 07:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0004_auto_20210318_0729'),
        ('feed', '0003_auto_20210318_0729'),
        ('purchase', '0004_auto_20210318_0729'),
        ('account', '0003_user_liked_feed'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='liked_feed',
        ),
        migrations.AddField(
            model_name='user',
            name='liked_feeds',
            field=models.ManyToManyField(related_name='liked_users', through='feed.FeedLike', to='feed.Feed'),
        ),
        migrations.AddField(
            model_name='user',
            name='products',
            field=models.ManyToManyField(through='purchase.Cart', to='product.Product'),
        ),
    ]
