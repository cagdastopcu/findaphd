#!/bin/bash
#  @author: Cagdas Topcu, MSc.
#  06 April 2017
# don't panic you will find a good PhD position.
# you shoul use it with cron
# example: crontab -e and add this line: 0,30 * * * * /home/username/phdfinder/phdfinder
# just change your e-mail address
newdata=$(curl -L https://euraxess.ec.europa.eu/jobs/search | grep -Po '(?<=href=")[^<]*' | tr '[A-Z]' '[a-z]' | grep -e phd -e p.h.d -e ph.d -e p.hd -e doctorate -e doctoral | awk '$0="https:/euraxess.ec.europa.eu/"$0')

# check the pseudo-db file if it does not exist create one
[ -e "pseudodbforphdf" ] || touch "pseudodbforphdf"
# save new data
echo $newdata > newpseudodbforphdf
# compare old and new ps-db file
if ! (cmp -s newpseudodbforphdf pseudodbforphdf);then
	# change old file
echo $newdata > pseudodbforphdf
	# send the report
mail -s "Hey check new PhD positions!" "myemail@myemail.com" <<EOF
$newdata
EOF
fi
