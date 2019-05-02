from flask import Flask, redirect, url_for, render_template, request
import pymongo

PYTHONIOENCODING = "utf-8"

server = pymongo.MongoClient("mongodb://mongodb:27017/")
mydb = server["sam"]
mycol = mydb["books"]

app = Flask(__name__)

@app.route('/')
def index():
  return render_template('login.html')

@app.route('/home', methods = ['GET' , 'POST'])
def login():
   
   if request.method == 'POST':
     user_name = request.form['loginname']
     if user_name == 'admin':
        return render_template('admin.html')
     elif user_name == '':
       return redirect(url_for('index'))
     else:
       return render_template('homepage.html',username = user_name)


@app.route('/info', methods = ['GET', 'POST'])
def info():
  #login()
  #username = login.user_name
  if request.method == 'POST':
    
    bookname = request.form['bookname']
    author = request.form['author']
    	
    if(bookname): # and author == ''):
      return redirect(url_for('read', bookname=bookname))
	  
    elif (bookname == '' and author != ''):
      return redirect(url_for('bookbyauthor', bookbyauthor=author))

    else:
      return redirect(url_for('read',bookname=bookname))


@app.route('/booklist' , methods = ['GET', 'POST'])
def booklist():
  login()
  username = login.user_name
  if request.method == 'GET':
    content = mycol.find()
    for x in content:
      booklist = (x['title'])

  return render_template('booklist.html', booklist = booklist, username = username)

@app.route('/read/<bookname>', methods = ['GET', 'POST'])
def read(bookname):
  #login()
  #username = login.user_name
  if request.method == 'GET':
    query = {"title": "%s" %bookname}
    content = mycol.find(query)
  
    for text in content:
      data = (text["story"])
	
  return render_template('read.html', story = data, bookname = bookname)

@app.route('/bookbyauthor/<author>', methods = ['GET', 'POST'])
def bookbyauthor(author):
  #login()
  #username = login.user_name
  if request.method == 'GET':
    query = {"author": "%s" %author}
    content = mycol.find(query)
  
    for books in content:
      booksbyauthor = (books["title"])
  #return booksbyauthor 
  return render_template("bookbyauthor.html", booklist = booksbyauthor, author=author) 


if __name__ == '__main__':
   app.run(host = '0.0.0.0',debug = True) 
