#!/bin/bash

help=false
debug=false
mode=gfm
file=
context=github/KUKU

for arg in "$@"; do
	case "$arg"  in
	-h | --help)
		help=true
		;;
	-d | --debug)
		debug=true
		;;
	-m | --markdown)
		mode=markdown
		;;
	-g | --gfm)
		mode=gfm
		;;
	-c)
		c=true
		;;
	--context=*)
		context="${arg:10}"
		;;
	*)
		if [[ "$c" ]]; then
			context="$arg"
			c=
		else
			file="$arg"
		fi
	esac
done

if [[ "$help" != 'true' && ! -f "$file" ]]; then
	echo "ERROR: file \"$file\" doesn't exist"
	help=true
fi

if [[ "$help" == 'true' ]]; then
	echo -e "Usage:" `basename $0` "[-h | --help] [-d | --debug] [-m | --markdown] [-g | --gfm] [-c context | --context=context] {inputMd}\n"
	echo -e "    -h, --help\n\tprint this help"
	echo -e "    -d, --debug\n\tprint debug information"
	echo -e "    -m, --markdown\n\tuse markdown mode [default gfm]"
	echo -e "    -g, --gfm\n\tuse 'github flavored markdown' mode [default gfm]"
	echo -e "    -c context, --context=context\n\tcontext for generating links"
	echo -e "    inputMd\n\tgithub MD file"
	exit -1
fi

if [[ "$debug" == 'true' ]]; then
	echo "MODE=$mode"
	echo "CONTEXT=$context"
	echo "FILE=$file"
fi

tmpFile=`mktemp`
echo -n '{
    "text": "' > $tmpFile
sed -z 's/\n/\\n/g;s/"/\\"/g' $file >> $tmpFile
echo -n '",
    "mode": "'$mode'",
    "context": "'$context'"
}' >> $tmpFile

echo -n "Genering HTML from $file ..."
curl -s https://api.github.com/markdown -X "POST" -d "@$tmpFile" > $tmpFile.html ; google-chrome $tmpFile.html > /dev/null 2>&1
echo ' done'

if [[ "$debug" == 'true' ]]; then
	echo "Keeping CURL input file at $tmpFile"
	echo 'use with '\''curl https://api.github.com/markdown -X "POST" -d "@'$tmpFile'" > '$tmpFile'.html'
else
	rm -rf $tmpFile
fi
