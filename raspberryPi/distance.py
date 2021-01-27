import codecs
import schedule
import time
import json
import firebase_admin
import RPi.GPIO as gpio
import time
import datetime
import sys

from firebase_admin import credentials

from firebase_admin import firestore


cred = credentials.Certificate("./key.json")

firebase_admin.initialize_app(cred)

db = firestore.client()

gpio.setmode(gpio.BCM)
gpio.setwarnings(False)

trig = 13
echo = 19
gpio.setup(trig, gpio.OUT)
gpio.setup(echo, gpio.IN)


def getdistance(trig, echo):
 gpio.output(trig, False)
 time.sleep(0.1)
 gpio.output(trig, True)
 time.sleep(0.00001)
 gpio.output(trig, False)
 while gpio.input(echo) == 0 :
  pulse_start = time.time()

 while gpio.input(echo) == 1 :
  pulse_end = time.time()

 pulse_duration = pulse_end - pulse_start
 distance = pulse_duration * 17000
 distance = round(distance, 2)
 return distance

roll = 1  #count 변수

while True:
 try:
  davg = 0
  doc_ref = db.collection(u'distance').document(str(roll))   #db - distance(collection) -> roll(document) 에 저장

  for i in range(0,10):
   davg += int(getdistance(trig, echo))

  distance = davg/10  #이상치 제거를 위해 10개 평균
  doc_ref.set({
   u'timestamp' : str(now),    #현재시간, field
   u'd': int(distance)
 })
  roll += 1
  doc = doc_ref.get()
  print(u'Document data: {}'.format(doc.to_dict()))
  doc = doc_ref.get()
 
  time.sleep(2)
 
 except (KeyboardInterrupt, SystemExit):
  gpio.cleanup()
  sys.exit()




