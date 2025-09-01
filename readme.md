Structure:
data is collected under:
/home/pi/ in -> "temphum"

Data is used to create plots, which are directly copied into:
/var/www/html/
To make it easily available for the running web server on the pi


This is how the crontab entry looks like:

```#check temperature and relative humidity and calculate absolute humidity, create plot to apache folder
*/5 *     * * *   sh /home/pi/temphum/plot-temphum.sh >> /home/pi/cron_temphum.log
1 0     * * *   sh /home/pi/temphum/temphum_renew.sh >> /home/pi/cron_temphumrenew.log
```
