# download mysql connector for python 
# from: https://dev.mysql.com/downloads/connector/odbc/
# select your Platform from drop-down and install it
from twisted.internet import reactor, threads
from urlparse import urlparse
import httplib
import itertools
import json
import mysql.connector

GOOGLE_API_KEY = 'YOUR GOOGLE API KEY HERE'

db = mysql.connector.connect(user='root', password='root',
                              host='127.0.0.1',
                              database='mobiletracker', autocommit=True)


cursor = db.cursor()

concurrent = 10
finished=itertools.count(1)
reactor.suggestThreadPoolSize(concurrent)

def getData(ourl):
    googleapiUrl = 'https://www.googleapis.com/pagespeedonline/v3beta1/mobileReady?url=' + ourl + '&key=' + GOOGLE_API_KEY
    print googleapiUrl
    url = urlparse(googleapiUrl)
    conn = httplib.HTTPSConnection(url.netloc)   
    conn.request("GET", url.path + '?' + url.query)
    res = conn.getresponse()
    return res.read()

def processResponse(response,url):
    jsonData = json.loads(response)
    try:
      score = str(jsonData['ruleGroups']['USABILITY']['score'])
    except Exception, e:
      score = '0'
    try:
      pass_ = jsonData['ruleGroups']['USABILITY']['pass']  #Boolean
      if pass_:
        pass_ = '1'
      else:
        pass_ = '0'
    except Exception, e:
      pass_ = '0'
    try:
      cms = str(jsonData['pageStats']['cms'])
    except Exception, e:
      cms = ''
    
    cursor.execute("SELECT id FROM mobile WHERE url='" + url + "'")
    result = cursor.fetchone()
    try:
      id_ = str(result[0])
      query = "UPDATE mobile SET score='" + score + "', pass='" + pass_ + "', cms='" + cms + "' WHERE id = '" + id_ + "'"
      print query
      cursor.execute(query)
    except Exception, e:
      query = "INSERT INTO mobile SET url='" + url + "', score='" + score + "', pass='" + pass_ + "', cms='" + cms + "'"
      print query
      cursor.execute(query)
    processedOne()

def processError(error,url):
    print "error", url, error
    processedOne()

def processedOne():
    if finished.next()==added:
        reactor.stop()

def addTask(url):
    req = threads.deferToThread(getData, url)
    req.addCallback(processResponse, url)
    req.addErrback(processError, url)   

added=0
for url in open('urllist.csv'):
    added+=1
    addTask(url.strip())

try:
    reactor.run()
except KeyboardInterrupt:
    reactor.stop()