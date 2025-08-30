#!/bin/bash
 
PLOT_CONFFILE="/home/pi/temphum/plot-temphum.conf"
PLOT_CONFFILE2="/home/pi/temphum/plot-af.conf"
PLOT_CONFFILE3="/home/pi/temphum/plot-af2.conf"
PLOT_CONFFILE4="/home/pi/temphum/plot-temp.conf"
PLOT_DATAFILE="/home/pi/temphum/plot-temphum.dat"
PLOT_DATAFILE2="/home/pi/temphum/plot-temphum2.dat"
PLOT_DATETIME=$(/bin/date +%Y-%m-%d_%H:%M:%S)
PLOT_TEMP=$(/usr/bin/python3 /home/pi/temphum/gettemp.py)
PLOT_HUM=$(/usr/bin/python3 /home/pi/temphum/gethum.py)
PLOT_AF=$(/usr/bin/python3 /home/pi/temphum/getaf.py)
 
echo "$PLOT_DATETIME $PLOT_TEMP $PLOT_HUM $PLOT_AF">> $PLOT_DATAFILE
echo "$PLOT_DATETIME $PLOT_TEMP $PLOT_HUM $PLOT_AF">> $PLOT_DATAFILE2
cat $PLOT_CONFFILE | /usr/bin/gnuplot
cat $PLOT_CONFFILE2 | /usr/bin/gnuplot
cat $PLOT_CONFFILE3 | /usr/bin/gnuplot
cat $PLOT_CONFFILE4 | /usr/bin/gnuplot

