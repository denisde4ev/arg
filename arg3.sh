#!/bin/sh

[ -t 1 ] && [ -t 2 ] && {
	IFS=''
	i=$*
	printf '%i:%i ' "$#" "${#i}"
} >&2


case $# in 0) echo; exit; esac

while :; do
	case $1 in *\'*) ;; *) printf %s "'$1' " ; shift; continue; esac
	remaning=$1
	startcut=${1%%\'*}

	while case $remaning in "$startcut"|'') false;; esac; do
		printf %s "'$startcut'\\'"
		remaning=${remaning#*\'}
		startcut=${remaning%%\'*}
	done

	shift
	case $# in
		0) printf %s "'$remaning'"; break;;
		*) printf %s "'$remaning' ";;
	esac 
done
echo
