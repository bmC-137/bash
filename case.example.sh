#!/bin/bash

# not tested for 'multitail'

tail -fn0 /var/log/messages | while read line
do
	echo $line | grep -i "refused|invalid|error|fail|lost|shutdown|down|offline"
		if [ $? = 0 ]
		then
			echo $line >> /tmp/error-messages-filtered
		fi
done
