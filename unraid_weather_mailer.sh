#!/bin/bash
#curl http://wttr.in/hfx?FTQ > forecast

cp /dev/null forecast

while [ ! -s forecast ]; do
    curl wttr.in/HFX?format="Weather:%c+%C\nHumidity:+%h\nTemperature:+%t\nFeelsLike:+%f\nUVIndex:+%u\nWind:+%w\nPrecipitation:+%p\n\nMoonPhase:+%m\nMoonDay:+%M\n\nDawn:+%D\nSunrise:+%S\nZenith:+%z\nSunset:+%s\nDusk:+%d\n\nCurrentTime:+%T\n" > forecast
done

export MAILTO=""
export CONTENT="forecast"
export SUBJECT="Cory's Current Conditions"
(
 echo "Subject: $SUBJECT"
 echo "MIME-Version: 1.0"
 echo "Content-Type: text/html"
 echo "Content-Disposition: inline"
 echo '<HTML><BODY><PRE>'
 cat $CONTENT
 echo '</PRE></BODY></HTML>'
) | sendmail $MAILTO

#curl -o forecast.png http://wttr.in/hfx_FQp.png
