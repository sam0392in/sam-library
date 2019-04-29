from flask import Flask, redirect, url_for, render_template, request
import pymongo

server = pymongo.MongoClient("mongodb://mongo:27017/")
mydb = server["samlibrary"]
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


@app.route('/info')
def home():
  if request.method == 'POST':
    
    bookname = request.form['bookname']
    author = request.form['author']
    	
    if (bookname != '' and author == ''):
      return redirect(url_for('read', bookname=bookname))
	  
    elif (bookname == '' and author != ''):
      return redirect(url_for('booksbyauthor', author=author))

    else:
      return redirect(url_for('exact',bookname=bookname, author=author ))


@app.route(/booklist)
def booklist():
  content = mycol.find()
  for x in content:
    booklist = (x['title'])

  return render_template('booklist.html', booklist = booklist)

@app.route('/read/<bookname>')
def read(bookname):
  query = {"title": "%s" %bookname}
  content = mycol.find(query)
  
  for text in content:
    data = (text["story"])
	
  return render_template('read.html', story = data)

@app.route('/bookbyauthor/<author>')
def bookbyauthor():
  query = {"author": "%s" %author}
  content = mycol.find(query)
  
  for books in content:
    booksbyauthor = (books["title"])
  
  return render_template("booksbyauthor.html", booklist = booksbyauthor) 


if __name__ == '__main__':
   app.run(host = '0.0.0.0',debug = True) 
