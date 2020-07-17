from django.shortcuts import render
import schedule
import time

# Create your views here.
from .models import *

import random
import json

def cryptoindex(request):
    indicator = random.randint(0,100)
    data = [indicator]
    print(indicator)
    return render(request, 'cryptoindex.html', context = {"indicator" : json.dumps(data)} )



