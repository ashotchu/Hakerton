import codecs
import schedule
import time
import json
import firebase_admin
import RPi.GPIO as gpio
import time
import datetime
import sys

from hx711 import HX711
from firebase_admin import credentials
from firebase_admin import firestore

gpio.setmode(gpio.BCM)
gpio.setwarnings(False)

hx = HX711(13, 19)
#hx.reset()

now = datetime.datetime.now()
cred = credentials.Certificate("./key.json")
firebase_admin.initialize_app(cred)
db = firestore.client()


roll = 1
while True:
 try:
  wavg = 0
  doc_ref = db.collection(u'weight').document(str(roll))
  
  wei = hx.get_raw_data()
  for i in wei:
   wavg += i
  weight = wavg/len(wei)
  f_wei = int(weight/1000)
  
  if f_wei > 0:
   f_wei = f_wei

  else:
   f_wei = -f_wei
  doc_ref.set({
   u'timestamp' : str(now),
   u'w' : int(f_wei)
  })
  roll += 1
  doc = doc_ref.get()
  print(u'Doc data: {}'.format(doc.to_dict()))
  doc = doc_ref.get()

  time.sleep(2)

 except (KeyboardInterrupt, SystemExit):
  gpio.cleanup()
  sys.exit()