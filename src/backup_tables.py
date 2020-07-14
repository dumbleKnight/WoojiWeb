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

def backuptable(table='blog_author'):
    sql = "show tables like 'bak_"+table+"';"
    cursor.execute(sql)
    result = cursor.fetchall()
    if len(result) == 0:
        sql = "create table bak_"+table+" like "+table+";"; print(sql)
        cursor.execute(sql)
        sql = "insert into bak_"+table+" select * from "+table+";"; print(sql)
        cursor.execute(sql)
        db.commit()
    return

def bak_tables():
    tables = ['auth_permission', 
            'auth_user', 
            'blog_author', 
            'blog_blog', 
            'blog_blog_tag', 
            'blog_comment', 
            'blog_tag', 
            'stock_stockdata', 
            'stock_stockprofile', 
            'stock_stockuniverse', 
            'stock_treemapcoordinate']
    for table in tables:
        backuptable(table)
    return

def drop_tables():
    sql = "show tables;"
    cursor.execute(sql)
    result = cursor.fetchall()
    tables = [x[0] for x in result if not ('bak_' in x[0])]
    
    sql = "SET foreign_key_checks = 0;"; print(sql)
    cursor.execute(sql)

    for table in tables:
        sql = "drop table "+table+";"; print(sql)
        cursor.execute(sql)
    sql = "SET foreign_key_checks = 1;"; print(sql)
    cursor.execute(sql)
    db.commit()
    return

def recover_blog():
    sql = "show tables like 'blog_%';"
    cursor.execute(sql)
    result = cursor.fetchall()
    tables = [x[0] for x in result]
    sql = "SET foreign_key_checks = 0;"; print(sql)
    cursor.execute(sql)
    for table in tables:
        sql = "insert into "+table+" select * from bak_"+table+";"; print(sql)
        cursor.execute(sql)
    sql = "SET foreign_key_checks = 1;"; print(sql)
    cursor.execute(sql)
    db.commit()
    return


if __name__ == "__main__":
    #bak_tables()
    #drop_tables()
    recover_blog()


