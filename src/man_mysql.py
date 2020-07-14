import pandas as pd
import MySQLdb
import random
import squarify
import numpy as np
import os

user = "wooji"
host = "localhost"
passwd = "Wooji.1234"
dbname = "wjweb"
db = MySQLdb.connect(host=host, user=user, passwd=passwd, db=dbname)
cursor = db.cursor()

fcode_secind = "../data/code_secind.csv"
funiverse = "../data/predefine_universe.csv"
fcsv_marketdata = '../data/dow30_marketdata.csv'
fcsv_fund = '../data/dow30_fundament.csv'

fmysql_profile = '../data/tomysql_profile.csv'
fmysql_data = '../data/tomysql_data.csv'
fmysql_uni = '../data/tomysql_uni.csv'
fmysql_treemap = '../data/tomysql_treemap.csv'

path_upload_marketdata = '../data/histdata_market/'
path_upload_fund = '../data/histdata_fundamental/'


def set_universe():
    push_to_mysql(fmysql_uni, 'stock_stockuniverse')
    return


def set_profile():
    get_profiletable().to_csv(fmysql_profile, index=None)
    push_to_mysql(fmysql_profile, 'stock_stockprofile')
    return


def set_data():
    get_datatable().to_csv(fmysql_data, index=None)
    push_to_mysql(fmysql_data, 'stock_stockdata')
    return


def set_treemap():
    get_treemaptable().to_csv(fmysql_treemap, index=None)
    push_to_mysql(fmysql_treemap, 'stock_treemapcoordinate')
    return


def get_profiletable(fn=fcsv_marketdata):
    code = pd.read_csv(fcode_secind)
    df = pd.read_csv(fn)
    df = df.groupby('tic', as_index=False).last()
    df.dropna(axis=0, how='any', subset=['tic'], inplace=True)
    syms = [s for s in df['tic'].values if ('.' not in s) and (not s[0].isdigit())]
    df = df[df['tic'].isin(syms)]
    # print(df[['tic','ggroup','gind','gsector','gsubind']])
    sector = []
    industry = []
    for x in df['gind'].values:
        sector.append(code.loc[code['code'] == x, 'sector'].values[0])
        industry.append(code.loc[code['code'] == x, 'industry'].values[0])

    df = df[['tic', 'conm', 'exchg', 'loc', 'add1', 'add2', 'city', 'state', 'addzip', 'weburl', 'ipodate', 'busdesc']]
    df = df.rename(columns={'tic': 'symbol', 'conm': 'company_name', 'exchg': 'exchange', 'loc': 'country',
                            'add1': 'address1', 'add2': 'address2', 'addzip': 'zipcode', 'ipodate': 'ipo_date',
                            'busdesc': 'business_desc'})
    df['sector'] = sector
    df['industry'] = industry
    df.reset_index(drop=True, inplace=True)
    for i in range(len(df)):
        df.loc[i, 'company_name'] = adjust_companyname(df.loc[i, 'company_name'])
    df.loc[:,'ipo_date'] = df['ipo_date'].fillna('1900-01-01')
    return df


def adjust_companyname(s):
    ws = [w[0] + w[1:].lower() if (not w in ['INC', 'LLC', 'CORP']) and len(w) > 0 else w for w in s.strip().split(' ')]
    return ' '.join(ws)


def get_datatable():
    sql = "select symbol from stock_stockprofile;"
    cursor.execute(sql)
    result = cursor.fetchall()
    symbols = [x[0] for x in result]
    df = pd.read_csv(fcsv_marketdata)
    fund = pd.read_csv(fcsv_fund)

    dfout = {'symbol': [], 'histdata_market': [], 'histdata_fund': [], 'recent_date': [], 'recent_price': [],
             'recent_mktcap': [], 'recent_return_1d': [], 'recent_return_1w': [], 'recent_return_1m': [],
             'recent_return_1y': [], 'pred_short': [], 'pred_medium': [], 'pred_long': [],
             'pred_short_star': [], 'pred_medium_star': [], 'pred_long_star': [],
             'profile_id': []}
    # treemap = {'id':[], 'stockdata_id':[], 'stockuniverse_id':[], ''}
    # allindex = ['DOW30', 'SP100', 'SP500', 'SP400', 'SP600', 'SP1500', 'RUSSELL3000']

    for sym in symbols:
        sub = df[df['tic'] == sym]
        sub = sub.sort_values(['datadate'])
        adjcols = {'prccd': 'close', 'prchd': 'high', 'prcld': 'low', 'prcod': 'open'}
        for col in adjcols: sub[adjcols[col]] = sub[col] / sub['ajexdi']
        sub['mktcap'] = sub['close'] * sub['cshoc']
        sub = sub[['datadate', 'tic', 'open', 'high', 'low', 'close', 'cshtrd', 'mktcap']]
        sub.rename(columns={'datadate': 'date', 'tic': 'symbol', 'cshtrd': 'volume'}, inplace=True)
        sub.dropna(axis=0, how='any', subset=['date', 'close', 'volume', 'mktcap'], inplace=True)
        sub['date'] = pd.DatetimeIndex(sub['date'].astype(int).astype(str))
        sub = sub.round(2)

        print('save market data to:', path_upload_marketdata + '/' + sym + '.csv', len(sub))
        sub.to_csv(path_upload_marketdata + '/' + sym + '.csv', index=None)

        subfund = fund[fund['tic'] == sym]
        print('save fundamental data to:', path_upload_fund + sym + '.csv', len(subfund))
        subfund.to_csv(path_upload_fund + sym + '.csv', index=None)

        dfout['symbol'].append(sym)
        dfout['histdata_market'].append('histdata_market/' + sym + '.csv')
        dfout['histdata_fund'].append('histdata_fundamental/' + sym + '.csv')
        dfout['recent_date'].append(sub['date'].values[-1])
        dfout['recent_price'].append(sub['close'].values[-1])
        dfout['recent_mktcap'].append(sub['mktcap'].values[-1])
        dfout['recent_return_1d'].append(sub['close'].values[-1] / sub['close'].values[-2] - 1.0)
        dfout['recent_return_1w'].append(sub['close'].values[-1] / sub['close'].values[-6] - 1.0)
        dfout['recent_return_1m'].append(sub['close'].values[-1] / sub['close'].values[-23] - 1.0)
        if len(sub) >= 253:
            dfout['recent_return_1y'].append(sub['close'].values[-1] / sub['close'].values[-253] - 1.0)
        else:
            dfout['recent_return_1y'].append(None)
        dfout['pred_short'].append(random.random())
        dfout['pred_medium'].append(random.random())
        dfout['pred_long'].append(random.random())
        dfout['profile_id'].append(sym)

        # k = max(1, int(random.random() * len(allindex)))
        # universe['id'] += list(range(len(universe['id'])+1, len(universe['id'])+1+k, 1))
        # universe['stockdata_id'] += [sym]*k
        # universe['stockuniverse_id'] += allindex[:k]

    dfout['pred_short_star'] = pred_to_star(dfout['pred_short'])
    dfout['pred_medium_star'] = pred_to_star(dfout['pred_medium'])
    dfout['pred_long_star'] = pred_to_star(dfout['pred_long'])

    dfout = pd.DataFrame(dfout)
    # dfuni = pd.DataFrame(universe)
    return dfout


def pred_to_star(pred):
    nlevel = 5
    ndata = len(pred)
    ind = np.argsort(pred)
    out = np.zeros(ndata).astype(int) - nlevel
    out[ind[int(ndata / 2):]] += 1
    for i in range(1, int(nlevel) * 2):
        out[ind[int(i * ndata / nlevel / 2):]] += 1
    return out


def get_treemaptable():
    flag = pd.read_csv(funiverse)
    unis = list(flag.columns);
    unis.remove('symbol')
    flag = flag.merge(pd.read_csv(fmysql_data)[['symbol', 'recent_mktcap']], how='inner', on='symbol')

    dfout = {'id': [], 'x0': [], 'y0': [], 'x1': [], 'y1': [], 'data_id': [], 'profile_id': [], 'universe_id': []}
    for u in unis:
        sub = flag[flag[u] == 1].sort_values('recent_mktcap', ascending=False)
        print('=======', u, '=======')
        print(sub)
        dfout['id'] += list(range(len(dfout['id']) + 1, len(dfout['id']) + 1 + len(sub)))
        dfout['data_id'] += list(sub['symbol'].values)
        dfout['profile_id'] += list(sub['symbol'].values)
        dfout['universe_id'] += [u] * len(sub)
        ps = get_treemapcoordinate(sub['recent_mktcap'].values)
        dfout['x0'] += [p['x'] for p in ps]
        dfout['y0'] += [p['y'] for p in ps]
        dfout['x1'] += [p['x'] + p['dx'] for p in ps]
        dfout['y1'] += [p['y'] + p['dy'] for p in ps]

    dfout = pd.DataFrame(dfout)
    return dfout


def get_treemapcoordinate(values):
    # these values define the coordinate system for the returned rectangles
    # the values will range from x to x + width and y to y + height
    x = 0.
    y = 0.
    width = 800.
    height = 600.

    # values must be sorted descending (and positive, obviously)
    # values.sort(reverse=True)

    # the sum of the values must equal the total area to be laid out
    # i.e., sum(values) == width * height
    values = squarify.normalize_sizes(values, width, height)

    # returns a list of rectangles
    rects = squarify.squarify(values, x, y, width, height)

    # padded rectangles will probably visualize better for certain cases
    padded_rects = squarify.padded_squarify(values, x, y, width, height)

    # result:
    # [
    # {
    #  "dy": 433,
    #  "dx": 327.7153558052434,
    #  "x": 0,
    #  "y": 0
    # },
    # {
    #  "dy": 330.0862676056338,
    #  "dx": 372.2846441947566,
    #  "x": 327.7153558052434,
    #  "y": 0
    # }, ...

    return padded_rects


def clear_mysql(path_proj):
    cursor.execute('show tables;')
    tables = [x[0] for x in cursor.fetchall()]
    for x in ['stock_treemapcoordinate', 'stock_stockdata', 'stock_stockprofile', 'stock_stockuniverse']:
        if x in tables:
            sql = "drop table " + x + ";";
            print(sql);
            cursor.execute(sql)

    sql = "delete from django_admin_log;";
    print(sql);
    cursor.execute(sql)
    sql = "delete from `django_migrations` where `app` = 'stock';";
    print(sql);
    cursor.execute(sql)
    sql = "delete from `auth_permission` where `name` like '%treemap%';";
    print(sql);
    cursor.execute(sql)
    sql = "delete from `auth_permission` where `name` like '%stock%';";
    print(sql);
    cursor.execute(sql)
    sql = "delete from `django_content_type` where `app_label` = 'stock';";
    print(sql);
    cursor.execute(sql)
    db.commit()

    cmd = 'cd ' + path_proj + '; rm -fv */migrations/0*.py; rm -rfv */__pycache__; rm -rfv */*/__pycache__; ' + \
          'python3 manage.py makemigrations; python3 manage.py migrate; python3 manage.py collectstatic;'
    os.system(cmd)
    return


def push_to_mysql(fn, mysql_table):
    sql = "LOAD DATA LOCAL INFILE  '" + fn + "' INTO TABLE " + mysql_table + " FIELDS TERMINATED BY ',' ENCLOSED BY '" + '"' + "' IGNORE 1 ROWS; "
    print(sql)
    cursor.execute(sql)
    db.commit()
    # db.close()
    return


if __name__ == "__main__":
    #clear_mysql("../wjweb/")
    set_universe()
    set_profile()
    set_data()
    set_treemap()
