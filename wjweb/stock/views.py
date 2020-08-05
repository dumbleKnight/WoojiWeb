from django.shortcuts import render

# Create your views here.
from .stock import *
from .presentation import TreemapCoordinate

#from .models import StockUniverse, StockProfile, StockData, TreemapCoordinate

import markdown
from django.http import HttpResponse, JsonResponse
import json
import pandas as pd
import mysql.connector
from json import JSONEncoder
import datetime


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
    return json.dumps({col: list(df[col].values) for col in list(df.columns)},default = str)


def stocktimeseries(request, pk):
    sdata = StockData.objects.get(symbol=pk)
    sprofile = StockProfile.objects.get(symbol=pk)
    mydb = connectDataBase()
    data = collectData(mydb,sdata.symbol)
    test = df2Pandas(data,sdata.symbol)
    histprice = df2json(test)
    mydb.close()
    #histfund = pd.read_csv(sdata.histdata_fund)
    return render(request, 'stockdetail.html', context={'sdata': sdata, 'sprofile': sprofile,
                                                        'histprice': histprice})

def connectDataBase():
    mydb = mysql.connector.connect(
	host = "wjweb.c5ax87iajl4c.us-east-2.rds.amazonaws.com",
	user = "admin",
	passwd = "Wooji1234",
	database = "wj_Equity"
    )
    return mydb

def collectData(mydb,symbol):
    mycursor = mydb.cursor()
    sql = "SELECT date,open,high,low,close,volume,mktcap FROM Quote WHERE symbol = '" + symbol + "'"
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    mycursor.close()
    return myresult

def df2Pandas(data,symbol):
    column_names = ["date", "symbol", "open","high","low","close","volume","mktcap"]
    df = pd.DataFrame(columns = column_names)
    for row in data:
        df = df.append({'date' : row[0].date(),
                        'symbol' : symbol,
                        'open' : row[1],
                        'high'  : row[2],
                        'low' : row[3],
                        'close' : row[4],
                        'volume' : row[5],
                        'mktcap' : row[6]}, 
                        ignore_index=True)
    return df





