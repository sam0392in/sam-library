from flask import Flask, redirect, url_for, render_template, request, jsonify
from argparse import Namespace
import pymongo
from flask_pymongo import PyMongo
import json
from bson import json_util

app = Flask(__name__)

server = pymongo.MongoClient("mongodb://mongodb:27017/")
mydb = server["sam"]
mycol = mydb["books"]

@app.route("/")
def read():
    datalist = []
    for x in mycol.find():
      datalist.append(x)  
    return json.dumps(json_util.dumps(datalist))

if __name__ == '__main__':
   app.run(host = '0.0.0.0',debug = True)

