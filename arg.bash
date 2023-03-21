#!/bin/bash


if [ -t 1 ] && [ -t 2 ]; then
	IFS=''
	i=$*
	printf '%i:%i ' "$#" "${#i}"
fi >&2

{
	# `@Q` requires bash 4.1 and up. ref: https://unix.stackexchange.com/a/379190

	# no need: to use printf instead of echo in this case
	# using `echo` with untrusted arguments in bash is mostly fine ref: [bash's echo command is broken](https://youtu.be/lq98MM2ogBk)
	# * in this case we know the first arg will not be with dash
	# * bash will not use backslash by default (like dash does in `echo 1\\n2` +dash does not support -E)
	##while :; do
	##	case $# in 0) break; esac
	##	printf %s "${1@Q}"; shift
	##	case $# in 0) break; esac
	##	printf ' %s' "${@@Q}"
	##break; done
	##echo

	echo "${@@Q}"
}

