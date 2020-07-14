from django.db import models

# Create your models here.

from django.contrib.auth.models import AbstractUser
from django.db.models.signals import post_save
from django.dispatch import receiver

from django.utils.translation import ugettext_lazy 
from .managers import CustomUserManager

'''
class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='userprofile')
    head_pic = models.ImageField(upload_to="user_head_pic/", blank=True, default='user_head_pic/default.jpg')
    bio = models.TextField(max_length=1000, blank=True)
'''

class CustomUser(AbstractUser):
    #username = None
    #email = models.EmailField(ugettext_lazy('email address'), unique=True)
    head_pic = models.ImageField(upload_to="user_head_pic/", blank=True, default='user_head_pic/default.jpg', 
            verbose_name='Account photo')
    bio = models.TextField(max_length=1000, blank=True, verbose_name='Self-description')
    is_premium = models.BooleanField(default=False, verbose_name='premium status')
    #USERNAME_FIELD = 'email'
    #REQUIRED_FIELDS = ['email']

    #objects = CustomUserManager()

    def __str__(self):
        return self.username

#@receiver(post_save, sender=User)
#def create_user_profile(sender, instance, created, **kwargs):
#    if created:
#        UserProfile.objects.create(user=instance)

#@receiver(post_save, sender=User)
#def save_user_profile(sender, instance, **kwargs):
#    instance.useprofile.save()


