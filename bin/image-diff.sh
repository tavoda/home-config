#!/bin/bash
OLD=""
i=""

for i in $@; do
	convert -resize 25% $i CONV-$i
	rm -rf $i
	if [[ ! -z $OLD ]]; then
		result=`compare -metric AE -fuzz 8% -compose plus CONV-$OLD CONV-$i /tmp/out$$.jpg 2>&1`
		if [[ $result -gt 4000 ]]; then
			echo "DIFF $OLD $i - $result"
			cp CONV-$OLD $OLD
			cp CONV-$i $i
		fi
	fi
	rm -rf "CONV-$OLD"
	OLD=$i
done
rm -rf "CONV-$i"
rm -rf /tmp/out$$.jpg
