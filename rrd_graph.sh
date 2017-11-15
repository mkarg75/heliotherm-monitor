#!/bin/bash
rrdtool graphv /var/www/html/waermepumpe.png -F -w 600 -h 800 -t "Letzte Stunde"\
       	--start -1h --end now DEF:Aussentemperatur=waermepumpe.rrd:Aussentemp:AVERAGE\
	DEF:Brauchwassertemperatur=waermepumpe.rrd:Brauchwassertemp:AVERAGE\
	DEF:Vorlauftemperatur=waermepumpe.rrd:Vorlauftemp:AVERAGE\
	DEF:Ruecklauftemperatur=waermepumpe.rrd:Ruecklauftemp:AVERAGE\
	DEF:Sole-Eintrittstemperatur=waermepumpe.rrd:EQ-Eintritt:AVERAGE\
	DEF:Sole-Austrittstemperatur=waermepumpe.rrd:EQ-Austritt:AVERAGE\
	DEF:Heizungspumpe=waermepumpe.rrd:Heizungspumpe:AVERAGE\
	DEF:Warmwasservorrang=waermepumpe.rrd:Warmwasservorrang:AVERAGE\
	LINE1:Aussentemperatur#1c49ff:"Aussentemperatur\l"\
	LINE2:Brauchwassertemperatur#ff1c2e:"Brauchwassertemperatur\l"\
	LINE3:Vorlauftemperatur#c11518:"Vorlauftemperatur\l"\
	LINE4:Ruecklauftemperatur#4b99d8:"Ruecklauftemperatur\l"\
	LINE5:Sole-Eintrittstemperatur#4bd85e:"Sole-Eintrittstemperatur\l"\
	LINE6:Sole-Austrittstemperatur#24822f:"Sole-Austrittstemperatur\l"\
	AREA:Heizungspumpe#af682d:"Heizungspumpe\l"\
	AREA:Warmwasservorrang#723a0c:"Warmwasservorrang\l"\
	TEXTALIGN:left

rrdtool graphv /var/www/html/waermepumpe_hourly.png -F -w 600 -h 800 -t "Letzte Stunde"\
       	--start -1h --end now DEF:Aussentemperatur=waermepumpe.rrd:Aussentemp:AVERAGE\
	DEF:Brauchwassertemperatur=waermepumpe.rrd:Brauchwassertemp:AVERAGE\
	DEF:Vorlauftemperatur=waermepumpe.rrd:Vorlauftemp:AVERAGE\
	DEF:Ruecklauftemperatur=waermepumpe.rrd:Ruecklauftemp:AVERAGE\
	DEF:Sole-Eintrittstemperatur=waermepumpe.rrd:EQ-Eintritt:AVERAGE\
	DEF:Sole-Austrittstemperatur=waermepumpe.rrd:EQ-Austritt:AVERAGE\
	DEF:Heizungspumpe=waermepumpe.rrd:Heizungspumpe:AVERAGE\
	DEF:Warmwasservorrang=waermepumpe.rrd:Warmwasservorrang:AVERAGE\
	LINE1:Aussentemperatur#1c49ff:"Aussentemperatur\l"\
	LINE2:Brauchwassertemperatur#ff1c2e:"Brauchwassertemperatur\l"\
	LINE3:Vorlauftemperatur#c11518:"Vorlauftemperatur\l"\
	LINE4:Ruecklauftemperatur#4b99d8:"Ruecklauftemperatur\l"\
	LINE5:Sole-Eintrittstemperatur#4bd85e:"Sole-Eintrittstemperatur\l"\
	LINE6:Sole-Austrittstemperatur#24822f:"Sole-Austrittstemperatur\l"\
        AREA:Heizungspumpe#af682d:"Heizungspumpe\l"\
        AREA:Warmwasservorrang#723a0c:"Warmwasservorrang\l"\
	TEXTALIGN:left


rrdtool graphv /var/www/html/waermepumpe_daily.png -F -w 600 -h 800 -t "Letzter Tag"\
       	--start -1d --end now DEF:Aussentemperatur=waermepumpe.rrd:Aussentemp:AVERAGE\
	DEF:Brauchwassertemperatur=waermepumpe.rrd:Brauchwassertemp:AVERAGE\
	DEF:Vorlauftemperatur=waermepumpe.rrd:Vorlauftemp:AVERAGE\
	DEF:Ruecklauftemperatur=waermepumpe.rrd:Ruecklauftemp:AVERAGE\
	DEF:Sole-Eintrittstemperatur=waermepumpe.rrd:EQ-Eintritt:AVERAGE\
	DEF:Sole-Austrittstemperatur=waermepumpe.rrd:EQ-Austritt:AVERAGE\
	DEF:Heizungspumpe=waermepumpe.rrd:Heizungspumpe:AVERAGE\
	DEF:Warmwasservorrang=waermepumpe.rrd:Warmwasservorrang:AVERAGE\
	LINE1:Aussentemperatur#1c49ff:"Aussentemperatur\l"\
	LINE2:Brauchwassertemperatur#ff1c2e:"Brauchwassertemperatur\l"\
	LINE3:Vorlauftemperatur#c11518:"Vorlauftemperatur\l"\
	LINE4:Ruecklauftemperatur#4b99d8:"Ruecklauftemperatur\l"\
	LINE5:Sole-Eintrittstemperatur#4bd85e:"Sole-Eintrittstemperatur\l"\
	LINE6:Sole-Austrittstemperatur#24822f:"Sole-Austrittstemperatur\l"\
        AREA:Heizungspumpe#af682d:"Heizungspumpe\l"\
        AREA:Warmwasservorrang#723a0c:"Warmwasservorrang\l"\
	TEXTALIGN:left

rrdtool graphv /var/www/html/waermepumpe_weekly.png -F -w 600 -h 800 -t "Letzte Woche"\
       	--start -7d --end now DEF:Aussentemperatur=waermepumpe.rrd:Aussentemp:AVERAGE\
	DEF:Brauchwassertemperatur=waermepumpe.rrd:Brauchwassertemp:AVERAGE\
	DEF:Vorlauftemperatur=waermepumpe.rrd:Vorlauftemp:AVERAGE\
	DEF:Ruecklauftemperatur=waermepumpe.rrd:Ruecklauftemp:AVERAGE\
	DEF:Sole-Eintrittstemperatur=waermepumpe.rrd:EQ-Eintritt:AVERAGE\
	DEF:Sole-Austrittstemperatur=waermepumpe.rrd:EQ-Austritt:AVERAGE\
	DEF:Heizungspumpe=waermepumpe.rrd:Heizungspumpe:AVERAGE\
	DEF:Warmwasservorrang=waermepumpe.rrd:Warmwasservorrang:AVERAGE\
	LINE1:Aussentemperatur#1c49ff:"Aussentemperatur\l"\
	LINE2:Brauchwassertemperatur#ff1c2e:"Brauchwassertemperatur\l"\
	LINE3:Vorlauftemperatur#c11518:"Vorlauftemperatur\l"\
	LINE4:Ruecklauftemperatur#4b99d8:"Ruecklauftemperatur\l"\
	LINE5:Sole-Eintrittstemperatur#4bd85e:"Sole-Eintrittstemperatur\l"\
	LINE6:Sole-Austrittstemperatur#24822f:"Sole-Austrittstemperatur\l"\
        AREA:Heizungspumpe#af682d:"Heizungspumpe\l"\
        AREA:Warmwasservorrang#723a0c:"Warmwasservorrang\l"\
	TEXTALIGN:left

rrdtool graphv /var/www/html/waermepumpe_monthly.png -F -w 600 -h 800 -t "Letzter Monat"\
       	--start -1W --end now DEF:Aussentemperatur=waermepumpe.rrd:Aussentemp:AVERAGE\
	DEF:Brauchwassertemperatur=waermepumpe.rrd:Brauchwassertemp:AVERAGE\
	DEF:Vorlauftemperatur=waermepumpe.rrd:Vorlauftemp:AVERAGE\
	DEF:Ruecklauftemperatur=waermepumpe.rrd:Ruecklauftemp:AVERAGE\
	DEF:Sole-Eintrittstemperatur=waermepumpe.rrd:EQ-Eintritt:AVERAGE\
	DEF:Sole-Austrittstemperatur=waermepumpe.rrd:EQ-Austritt:AVERAGE\
	DEF:Heizungspumpe=waermepumpe.rrd:Heizungspumpe:AVERAGE\
	DEF:Warmwasservorrang=waermepumpe.rrd:Warmwasservorrang:AVERAGE\
	LINE1:Aussentemperatur#1c49ff:"Aussentemperatur\l"\
	LINE2:Brauchwassertemperatur#ff1c2e:"Brauchwassertemperatur\l"\
	LINE3:Vorlauftemperatur#c11518:"Vorlauftemperatur\l"\
	LINE4:Ruecklauftemperatur#4b99d8:"Ruecklauftemperatur\l"\
	LINE5:Sole-Eintrittstemperatur#4bd85e:"Sole-Eintrittstemperatur\l"\
	LINE6:Sole-Austrittstemperatur#24822f:"Sole-Austrittstemperatur\l"\
        AREA:Heizungspumpe#af682d:"Heizungspumpe\l"\
        AREA:Warmwasservorrang#723a0c:"Warmwasservorrang\l"\
	TEXTALIGN:left

