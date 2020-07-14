from django.urls import path, re_path
from . import views

urlpatterns = [
    path('register/', views.accounts_register, name='register'),
    path('activate/<slug:uidb64>/<slug:token>)/', views.activate, name='activate'), 
    #path('myprofile/', views.myprofile, name='myprofile'), 
    path('update/', views.UpdateProfile.as_view(), name='my_account'), 
    #path('myposts/', views.mypostsview, name='myposts')
    #re_path(r'^settings/account/$', views.UpdateProfile.as_view(), name='my_account'),
]

