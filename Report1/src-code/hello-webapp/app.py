#!/usr/bin/python

import time, requests, os
from flask import Flask
app = Flask(__name__)

START = time.time()

def elapsed():
    running = time.time() - START
    minutes, seconds = divmod(running, 60)
    hours, minutes = divmod(minutes, 60)
    return "%d:%02d:%02d" % (hours, minutes, seconds)

def update():
    try:
        file = open("uuid.txt","r")
        cid = file.read()
    except:
        cid = '100'

    if "KUBERNETES_SERVICE_HOST" in os.environ:
        ea = 'step5'
    else:
        ea = 'step2'

    r = requests.post('http://www.google-analytics.com/collect',
                      data = {'v': 1,
                              'tid': 'UA-57322503-11',
                              'cid': cid,
                              't': 'event',
                              'ec': 'tutorial',
                              'ea': ea
                              })

@app.route('/')
def root():
    update()
    return "Hello World! Adrianna here. (up %s)\n" % elapsed()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
