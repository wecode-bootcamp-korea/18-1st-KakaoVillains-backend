# Generated by Django 3.1.7 on 2021-03-24 11:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0004_auto_20210318_0729'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='category',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='product.category'),
        ),
        migrations.AddField(
            model_name='product',
            name='sell_count',
            field=models.IntegerField(default=0),
        ),
    ]
