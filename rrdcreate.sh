rrdtool create waermepumpe.rrd --step 120 \
	DS:Aussentemp:GAUGE:120:-30:45 \
	DS:Brauchwassertemp:GAUGE:120:0:60 \
	DS:Vorlauftemp:GAUGE:120:0:60 \
	DS:Ruecklauftemp:GAUGE:120:0:60 \
	DS:EQ-Eintritt:GAUGE:120:-30:30 \
	DS:EQ-Austritt:GAUGE:120:-30:30 \
	DS:TempVerdampfer:GAUGE:120:0:100 \
	DS:TempKondensation:GAUGE:120:0:100 \
	DS:Heizungspumpe:GAUGE:120:0:10 \
	DS:Warmwasservorrang:GAUGE:120:0:10 \
	RRA:AVERAGE:0.5:12:525600 \
	RRA:AVERAGE:0.5:12:525600 \
	RRA:AVERAGE:0.5:1:525600 \
	RRA:AVERAGE:0.5:1:525600 \
	RRA:AVERAGE:0.5:1:525600 \
	RRA:AVERAGE:0.5:1:525600 \
	RRA:AVERAGE:0.5:1:525600 \
	RRA:AVERAGE:0.5:1:525600 \
	RRA:LAST:0:1:52600\
	RRA:LAST:0:1:52600


