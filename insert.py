from flask import Flask
import pymongo
import re
import json
server = pymongo.MongoClient("mongodb://mongodb:27017/")
mydb = server["sam"]
mycol = mydb["books"]

app = Flask(__name__)
#query = "fountain head"
'''
#Insert data

x = mycol.insert({
      "title": "roads",
       "author": "stuti",
      "story": "this is the test content for sample book Roads which sould be shown in UI. also this might have multiple line in the file qwhich shoudld dsnkdlgnh" })
'''

# fetch data
query = { "title": "roads" }
#content = mycol.find(query)

content = mycol.find(query)
for text in content:
  #print(text)
  book=(text["title"])
  author=(text['author'])
  print(text["title"])
  print(text['story'])
  #print ('%s'+':'+' %s') %(book ,author)
  #print('%s'+':'+ '%s') %('title', 'author')
#list database
#print (server.list_database_names())
#data=data.encode("utf-8")
#print(type(data))
