from django.urls import path
from . import views

app_name = 'blog'

urlpatterns = [
    path('', views.blogindex, name="index"), 
    path('<int:pk>', views.blogdetail, name='blog-detail'), 
    path('myposts/', views.mypostsview, name='myposts'), 
    path('mydrafts/', views.mydraftsview, name='mydrafts'), 
    path('create/', views.create_blog, name="create_blog"), 
    path('<int:pk>/update/', views.update_blog, name="update_blog"), 
]
