# Generated by Django 3.1.7 on 2021-03-18 05:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0002_character_product'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='updated_at',
            field=models.DateTimeField(auto_now=True),
        ),
    ]