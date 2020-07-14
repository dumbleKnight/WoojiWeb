from django.contrib import admin

# Register your models here.

from .stock import StockData, StockProfile, StockUniverse
from .presentation import TreemapCoordinate

#from .models import StockData, StockProfile, StockUniverse, TreemapCoordinate

@admin.register(TreemapCoordinate)
class TreemapCoordinateAdmin(admin.ModelAdmin):
    list_display = ['universe', 'profile', 'x0', 'y0', 'x1', 'y1']
    list_filter = ['universe']
    fields = [('universe', 'data'), 'profile', ('x0', 'y0', 'x1', 'y1')]


@admin.register(StockUniverse)
class StockUniverseAdmin(admin.ModelAdmin):
    list_display = ['name']
    fields = ['name', 'desc']


@admin.register(StockProfile)
class StockProfileAdmin(admin.ModelAdmin):
    list_display = ('symbol', 'company_name', 'exchange', 'country', 'ipo_date', 'sector', 'industry')
    list_filter = ('exchange', 'country', 'state', 'sector', 'industry')
    fields = [('symbol', 'exchange', 'ipo_date'),
              'company_name', 'sector', 'industry',
              ('address1', 'address2'),
              ('city', 'state', 'zipcode', 'country'),
              'weburl', 'business_desc']
    search_fields = ('symbol', 'company_name')


@admin.register(StockData)
class StockDataAdmin(admin.ModelAdmin):
    list_display = ('symbol', 'recent_price', 'recent_mktcap',
                    'pred_short', 'pred_medium', 'pred_long',
                    'pred_short_star', 'pred_medium_star', 'pred_long_star')
    list_filter = ['universe', 'pred_short_star', 'pred_medium_star', 'pred_long_star']
    fields = [('symbol', 'profile'),
              ('pred_short', 'pred_medium', 'pred_long'),
              ('pred_short_star', 'pred_medium_star', 'pred_long_star'),
              ('recent_date', 'recent_price', 'recent_mktcap'),
              ('recent_return_1d', 'recent_return_1w', 'recent_return_1m', 'recent_return_1y'),
              'histdata_market', 'histdata_fund']
    search_fields = ['symbol' ]
