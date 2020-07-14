from django.urls import path
from . import views

urlpatterns = [
    path('', views.realestateindex, name='realestateindex'),
]


