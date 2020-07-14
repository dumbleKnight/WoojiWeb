from django.shortcuts import render

# Create your views here.

from .models import *

def strategyindex(request):
    return render(request, 'coming_soon.html', context = {} )



