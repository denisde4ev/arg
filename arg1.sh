#!/bin/sh

[ -t 1 ] && {
	IFS=''
	i=$*
	printf '%i:%i ' "$#" "${#i}"
}

startspace=''
for i; do
	case $i in
		*"'"*) printf %s "$i" | sed -e "s/'/'\\\\''/g" -e "1s/^/${startspace}'/" -e "\$s/\$/'/";;
		*) printf %s "${startspace}'$i'";;
	esac
	startspace=' '
done
echo
