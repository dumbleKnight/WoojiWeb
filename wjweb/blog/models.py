from django.db import models
#from tinymce.models import HTMLField
from mdeditor.fields import MDTextField
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from django.urls import reverse

from datetime import datetime

# Create your models here.
#from accounts import models
#from accounts.models import CustomUser

#import importlib
#mymodels = importlib.import_module("accounts.models")
#from mymodels import CustomUser as Author
#Author = mymodels.CustomUser

#Author = models.ForeignKey('accounts.CustomUser', on_delete=models.CASCADE,)

#class Author(CustomUser):
    #first_name = models.CharField(max_length=200, blank=True)
    #last_name = models.CharField(max_length=200, blank=True)
    #photo = models.ImageField(upload_to="blog_author_photo/", blank=True)
    #bio = models.TextField(max_length=2000, blank=True)
    #email = models.EmailField(blank=True)

#    class Meta:
#        ordering = ['username']

#    def __str__(self):
#        return f'{self.username}'


class Tag(models.Model):
    name = models.CharField(max_length=200, blank=True)
    color = models.CharField(max_length=200, blank=True)
    def __str__(self):
        return self.name

    def get_blog_count(self):
        return Blog.objects.filter(tag__name=self.name).distinct().count()

    class Meta:
        ordering = ['name']
        verbose_name = "Tag"


class Blog(models.Model):
    #from django.apps import apps
    #Author = apps.get_model('accounts', 'CustomUser')
    #from accounts.models import CustomUser as Author
    
    author = models.ForeignKey('accounts.CustomUser', on_delete=models.CASCADE, null=False)
    title = models.CharField(max_length=200, blank=True)
    summary = models.TextField(max_length=2000, blank=True)
    #body = MDTextField(blank=True)
    body = RichTextUploadingField(blank=True)
    #body = HTMLField(blank=True)
    pub_time = models.DateTimeField(blank=True, default=datetime.now())
    update_time = models.DateTimeField(blank=True, default=datetime.now())
    tag = models.ManyToManyField('Tag', verbose_name='Blog Tag', blank=True)
    is_draft = models.BooleanField(default=True, verbose_name='Is draft')

    def __str__(self):
        return self.title + ' - ' + self.author.username

    def get_absolute_url(self):
        return reverse('blog:blog-detail', args=[str(self.id)])

class Comment(models.Model):
    #from django.apps import apps
    #Author = apps.get_model('accounts', 'CustomUser')
    #from accounts.models import CustomUser as Author
    
    blog = models.ForeignKey('Blog', on_delete=models.CASCADE, null=True, related_name='comments')
    author = models.ForeignKey('accounts.CustomUser', on_delete=models.CASCADE, null=False)
    content = models.TextField(max_length=2000, blank=True)
    time = models.DateTimeField(blank=True)

    def __str__(self):
        return "[" + self.time.strftime("%m/%d/%Y, %H:%M:%S")+ "] " + self.author.username + "'s comment on " + self.blog.title

    class Meta:
        ordering = ['time']


