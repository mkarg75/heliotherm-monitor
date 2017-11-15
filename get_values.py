#!/usr/bin/python
import sys
import socket
from pprint import pprint
from struct import *
from rrdtool import update as rrd_update
import time

LIN="02 FD D0 E0 00 00 05 7E 4C 49 4E 3B 4C"                            # LOGIN?
RID="02 FD D0 E0 00 00 05 7E 52 49 44 3B 70"                            # RID?
TEMP_OUT="02 FD D0 E0 00 00 09 7E 4D 50 2C 4E 52 3D 30 3B E5"           # AUssentemperatur
TEMP_WATER="02 FD D0 E0 00 00 09 7E 4D 50 2C 4E 52 3D 32 3B E3"         # Temperatur Brauchwasser
TEMP_VORL="02 FD D0 E0 00 00 09 7E 4D 50 2C 4E 52 3D 33 3B E0"          # Temperatur Vorlauf
TEMP_RUCKL="02 FD D0 E0 00 00 09 7E 4D 50 2C 4E 52 3D 34 3B E9"         # Temperatur Ruecklauf
EQ_ENTRY="02 FD D0 E0 00 00 09 7E 4D 50 2C 4E 52 3D 36 3B EF"           # EQ Eintritt
EQ_EXIT="02 FD D0 E0 00 00 09 7E 4D 50 2C 4E 52 3D 37 3B EC"            # EQ Austritt
TEMP_GAS="02 FD D0 E0 00 00 09 7E 4D 50 2C 4E 52 3D 39 3B FE"           # Temperatur Sauggas
COMPR="02 FD D0 E0 00 00 0A 7E 53 50 2C 4E 52 3D 31 30 3B 91"           # Status Verdichter: 0 - AUS, 8 - LAEUFT
COMPR_TIME="02 FD D0 E0 00 00 0A 7E 53 50 2C 4E 52 3D 31 31 3B"         # Verdichter Zeit
COMPR_REQ="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 35 36 3B B5"       # Verdichter Anforderung
TEMP_FWATER="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 31 31 3B B0"     # Temperatur Frischwasser IST
HEATING_PUMP="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 32 32 3B B0"    # Heizkreispumpe
STATUS_HOTWATER="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 32 35 3B B9" # STatus Warmwasser Vorrang
TEMP_STEAM="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 31 32 3B B5"      # Temperatur Verdampfung
TEMP_COND="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 31 33 3B B6"       # Temperatur Kondesation
LOW_PRESS="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 32 30 3B B6"       # Niederdruck in bar
HIGH_PRESS="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 32 31 3B B5"      # Hockdruck in bar
HPUMP="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 32 32 3B B0"           # HKR Pumpe
PRIO_WATER="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 32 35 3B B9"      # Status Warmwasser Vorrang
FWATER_PUMP="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 35 30 3B BF"     # Status Frischwasserpumpe
HSHOULD="02 FD D0 E0 00 00 0A 7E 4D 50 2C 4E 52 3D 35 37 3B B6"         # Heizkreis Sollwert
OPMODE="02 FD D0 E0 00 00 0A 7E 53 50 2C 4E 52 3D 31 33 3B 94"          # Betriebsart: 1 - AUTOMATIK
WNORMAL="02 FD D0 E0 00 00 0A 7E 53 50 2C 4E 52 3D 38 33 3B 8F"         # Warmwasser Temp Soll
WMIN="02 FD D0 E0 00 00 0A 7E 53 50 2C 4E 52 3D 38 35 3B 85"            # Warmwasser Temp Min
HOURS_COMP_WW="02 FD D0 E0 00 00 0B 7E 53 50 2C 4E 52 3D 31 37 31 3B C8"    # Betriebsstunden Verdichter WW
HOURS_COMP_HEAT="02 FD D0 E0 00 00 0B 7E 53 50 2C 4E 52 3D 31 37 32 3B CD"  # Betriebsstunden Kompressor Heizung
HOURS_COMP_TOTAL="02 FD D0 E0 00 00 0B 7E 53 50 2C 4E 52 3D 31 37 33 3B CE"     # Betriebsstunden Verdichter Gesamt
LOUT="02 FD D0 E0 00 00 06 7E 4C 4F 55 54 3B 92"                        # LOGOUT

def hexconv(clear):
    command = ''
    words = clear.split()
    for word in words:
        command += chr(int(word, 16))
    return command

def query(command):
    s.send(hexconv(command))
    time.sleep(1)
    response=s.recv(8192)
    #print (response,10)
    words = response.split(',')
    for word in words: 
        if "NAME" in word:
            print word
        if "VAL" in word:
            print word

def update_rrd(commands):
    values = []
    responses = []
    for command in commands:
        s.send(hexconv(command))
        time.sleep(1)
        responses.append(s.recv(8192))
    for response in responses:
        words = response.split(',')
        for word in words:
            if "NAME" in word:
                print word
            if "VAL" in word: 
                print word
                values.append(word.replace("VAL=", ""))
    ret = rrd_update('waermepumpe.rrd', 'N:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s' %(values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8], values[9]))

HOST = '172.31.24.15'
PORT = 4001
s = None
for res in socket.getaddrinfo(HOST, PORT, socket.AF_INET, socket.SOCK_STREAM):
    af, socktype, proto, canonname, sa = res
    try: 
        s = socket.socket(af, socktype, proto)
    except socket.error as msg:
        s = None
        continue
    try:
        s.connect(sa)
    except socket.error as msg:
        s.close()
        s = None
        continue
    break
if s is None:
    print "Could not open socket"
    sys.exit(1)

update_rrd([LIN, RID, TEMP_OUT, TEMP_WATER, TEMP_VORL, TEMP_RUCKL, EQ_ENTRY, EQ_EXIT, TEMP_STEAM, TEMP_COND, HPUMP, PRIO_WATER, LOUT])

#query(LIN)
#query(RID)
#query(HPUMP)
#query(PRIO_WATER)
#query(TEMP_OUT)
#query(TEMP_WATER)
#query(TEMP_VORL)
#query(TEMP_RUCKL)
#query(EQ_ENTRY)
#query(EQ_EXIT)
#query(TEMP_GAS)
#query(COMPR)
#query(TEMP_FWATER)
#query(TEMP_STEAM)
#query(TEMP_COND)
#query(LOW_PRESS)
#query(HIGH_PRESS)
#query(HPUMP)
#query(PRIO_WATER)
#query(FWATER_PUMP)
#query(HSHOULD)
#query(OPMODE)
#query(WNORMAL)
#query(WMIN)
#query(HOURS_COMP_WW)
#query(HOURS_COMP_HEAT)
#query(HOURS_COMP_TOTAL)
#query(LOUT)

s.close()
