import os
import django
import csv
import sys

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "kakaovillains.settings")
django.setup()

from account.models import User
from feed.models import Feed, FeedImage

CSV_PATH_PRODUCTS = 'kakao_crawling_text 복사본.csv'

with open(CSV_PATH_PRODUCTS) as file:
    data_reader = csv.reader(file)
    # next(file)
    for row in data_reader:
        Feed.objects.create(title=row[0], content=row[1])
        