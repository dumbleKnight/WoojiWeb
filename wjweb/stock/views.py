from django.shortcuts import render

# Create your views here.
from .stock import *
from .presentation import TreemapCoordinate

#from .models import StockUniverse, StockProfile, StockData, TreemapCoordinate

import markdown
from django.http import HttpResponse, JsonResponse
import json
import pandas as pd


def stockindex(request):
    if request.method == 'GET':
        return render(request, 'stockindex.html',
                      context={'universe': StockUniverse.objects.all(),
                               'profile': StockProfile.objects.all(),
                               'data': StockData.objects.all(),
                               'treemap': TreemapCoordinate.objects.all()})
    else:
        universe = request.POST["universe"]
        predterm = request.POST["predterm"]
        flag = request.POST["flag"]
        width = int(request.POST["width"]) 
        height = int(request.POST["height"]) 
        
        width0 = 800; height0 = 600

        tm = TreemapCoordinate.objects.filter(universe_id=universe)
        res = []
        for x in tm:
            pred = StockData.objects.filter(symbol=x.data_id)
            if predterm == 'Short-term':    predret = pred[0].pred_short_star
            if predterm == 'Medium-term':   predret = pred[0].pred_medium_star
            if predterm == 'Long-term':     predret = pred[0].pred_long_star
            if (flag == 'all') or ((flag == 'top') and abs(predret)==5):
                res.append([x.data_id, float(x.x0)/width0*width, float(x.y0)/height0*height, 
                    float(x.x1-x.x0)/width0*width, float(x.y1-x.y0)/height0*height, predret])
        return JsonResponse(res, safe=False)


def df2json(df):
    return json.dumps({col: list(df[col].values) for col in list(df.columns)})


def stocktimeseries(request, pk):
    sdata = StockData.objects.get(symbol=pk)
    sprofile = StockProfile.objects.get(symbol=pk)
    histprice = df2json(pd.read_csv(sdata.histdata_market))
    histfund = pd.read_csv(sdata.histdata_fund)
    return render(request, 'stockdetail.html', context={'sdata': sdata, 'sprofile': sprofile,
                                                        'histprice': histprice})

