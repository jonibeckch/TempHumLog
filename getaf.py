# SPDX-FileCopyrightText: Copyright (c) 2020 Bryan Siepert for Adafruit Industries
#
# SPDX-License-Identifier: MIT
import time
import board
import adafruit_shtc3

i2c = board.I2C()  # uses board.SCL and board.SDA
sht = adafruit_shtc3.SHTC3(i2c)

temperature, relative_humidity = sht.measurements
#print("%.1f" % temperature)
#print("%.1f" % relative_humidity)

T = temperature
r = relative_humidity
mw = 18.016
R = 8314.3
a = 7.5
b = 237.3
SDD = 6.1078 * 10**((a*T)/(b+T))
DD = r/100 * SDD
TK = T + 273.15
AF = 100000 * mw/R * DD/TK
print("%.2f" % AF)