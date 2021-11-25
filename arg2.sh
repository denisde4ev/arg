#!/bin/sh

[ -t 1 ] && {
	IFS=''
	i=$*
	printf '%i:%i ' "$#" "${#i}"
}

case $# in 0) echo; exit 0; esac

while
	case $1 in
		*"'"*) printf %s "$1" | sed -e "s/'/'\\\\''/g" -e "1s/^/'/" -e "\$s/\$/'/";;
		*) printf %s "'$1'";;
	esac
	shift
do
	case $# in 0) break; esac

	printf ' '
done
echo
