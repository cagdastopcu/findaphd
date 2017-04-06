#!/bin/bash
#  @author: Cagdas Topcu, MSc.
#  06 April 2017
# don't panic you will find a good PhD position.
# you should use this code with cron command.
# example: crontab -e and add this line: 0,30 * * * * /home/username/phdfinder/phdfinder
# just change your e-mail address
text=$(curl -L https://euraxess.ec.europa.eu/jobs/search | grep -Po '(?<=href=")[^<]*' | tr '[A-Z]' '[a-z]' | grep -e phd -e p.h.d -e ph.d -e p.hd -e doctorate -e doctoral | awk '$0="https:/euraxess.ec.europa.eu/"$0')

mail -s "Hell yeah!" "youremail@email.com" <<EOF
$text
EOF
