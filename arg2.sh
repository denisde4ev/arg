#!/bin/sh

[ -t 1 ] && {
	IFS=''
	i=$*
	printf '%i:%i ' "$#" "${#i}"
}

case $# in 0) echo; exit; esac

while
	case $1 in
		*"'"*) printf %s "$1" | sed -e "s/'/'\\\\''/g" -e "1s/^/'/" -e "\$s/\$/'/";;
		*) printf %s "'$1'";;
	esac

	shift && \
	case $# in 0) false; esac
do
	printf ' '
done
echo
