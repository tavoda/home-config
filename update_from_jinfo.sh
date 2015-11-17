#!/bin/bash
printHelp=true
if [[ 1 -ne $# ]]; then
	echo -e "ERROR: file parameter required\n"
elif [[ "-h" == "$1" || "--help" == "$1" ]]; then
	printHelp=true
elif [[ ! -r "$1" ]]; then
	echo -e "ERROR: file $1 is NOT readable\n"
else
	printHelp=false
fi

if [[ "true" == $printHelp ]]; then
	echo -e "USAGE: `basename $0` file.jinfo\n\tfile.jinfo - jinfo file to use"
	exit -1
fi

priority=100

while read type cname cpath; do
	if [[ "priority" == ${type:0:8} ]]; then
		priority=${type:9}
		echo PRIORITY changed to $priority
	elif (echo $type | grep -q '=' ); then
		echo unused PARAM: $type
	elif [[ ! -z "$type" && -r $cpath ]]; then
		printf "Installing %-12s AS %s\n" $cname $cpath
		update-alternatives --install /usr/bin/$cname $cname $cpath $priority
	fi
done < $1
