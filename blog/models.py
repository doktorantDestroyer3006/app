from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.urls import reverse


class Post(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    substance = models.TextField(default = "woda")
    date_posted = models.DateTimeField(default=timezone.now)
    author = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('post-detail', kwargs={'pk': self.pk})

# class Trip(Post):
# 	title = models.CharField(max_length=100)
# 	content= models.TextField()
# 	date_posted = models.DateTimeField(default=timezone.now)
# 	substance = models.CharField(max_length=100)
# 	chart = models.TextField