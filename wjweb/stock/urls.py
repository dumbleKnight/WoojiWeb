from django.urls import path
from . import views

urlpatterns = [
    path('', views.stockindex), 
    path('<slug:pk>', views.stocktimeseries)
]

