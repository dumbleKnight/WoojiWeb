from django.urls import path
from . import views

urlpatterns = [
    path('', views.cryptoindex, name='cryptoindex'),
]
