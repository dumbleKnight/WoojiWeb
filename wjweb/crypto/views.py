from django.shortcuts import render
from django.http import HttpResponse
import schedule
import time

# Create your views here.
from .models import *

import random
import json

def cryptoindex(request):
    indicator = random.randint(0,100)
    data = [indicator]
    if request.is_ajax():
        indicator = random.randint(0,100)
        data = [indicator]
        return HttpResponse(json.dumps(data))
    return render(request, 'cryptoindex.html', context = {"indicator" : json.dumps(data)} )



