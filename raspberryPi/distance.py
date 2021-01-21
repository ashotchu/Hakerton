import serial
import codecs
import schedule
import time
import json
import firebase_admin
import time
import datetime
import sys

from firebase_admin import credentials

from firebase_admin import firestore

port = 'COM4'
br = 9600
ard = serial.Serial(port, br)

cred = credentials.Certificate("./key.json")

firebase_admin.initialize_app(cred)

db = firestore.client()

roll = 1

def dec(a):
    a = a.decode()
    #a = str(a)
    return str(a)

def ardread():
    if ard.readable():
        LINE = ard.readline()
        distance = dec(LINE)
        return distance
    
while True:
    davg = 0
    doc_ref = db.collection(u'sensor').document(str(roll))

    for i in range(0,10):
        davg += ardread()

    distance = davg/10
    doc_ref.set({
        u'timestamp' : str(now),
        u'd': int(distance),
        u'roll' : int(roll)  
    })
    roll += 1
    doc = doc_ref.get()
    print(u'Document data: {}'.format(doc.to_dict()))
    doc = doc_ref.get()