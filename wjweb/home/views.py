from django.shortcuts import render
  
# Create your views here.
#from stock.stock import *
#from stock.presentation import *
#from option.models import *
#from crypto.models import *
#from realestate.models import *
#from blog.models import *

def homeview(request):
    return render(request, 'home.html', context = {})


