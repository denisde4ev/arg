#!/bin/sh

[ -t 1 ] && [ -t 2 ] && {
	IFS=''
	i=$*
	printf '%i:%i ' "$#" "${#i}"
} >&2


case $# in 0) echo; exit; esac


#log() { printf %s\\n " --> $*" >&2;  }
log() { :;  }

_arg4_tmp_=${BASH_VERSION-${ASH_VERSION-${ZSH_VERSION-${KSH_VERSION-${YASH_VERSION-$( (eval 'a=" "; echo ${a/" "/x}') 2>/dev/null 1>&2 )}}}}}
case $?:$_arg4_tmp_ in # doesnt work for `dash`, `posh`, (older version of working shell are never tested)
0:*[!" "]*)
	eval "_escape_() { printf %s\\\\n \"${1//\\'/\\'\\\\\\'\\'}\"; }"
	;;
*)
	_escape_() {
		case $1 in *"'"*) ;; *)
			log using replacement
			printf %s "'$1'"
			return
		esac
		case ${#1} in [0-9]|[0-9][0-9]) # calling `sed` might be slow for many short strings
			_arg4_tmp_=$1
			printf "'"
			while case $_arg4_tmp_ in *"'"*) ;; *) false; esac; do
				printf %s "${_arg4_tmp_%%\'*}'\''";
				_arg4_tmp_=${_arg4_tmp_#*"'"}
			done
			printf %s "$_arg4_tmp_'"
			return
		esac
		log using sed
		printf %s "$1" | sed "s/'/'\\\\''/g; 1s/^/'/; $s/$/' /"
	}
esac

while :; do
	_escape_ "$1"

	shift
	case $# in 0) break; esac

	printf " "
done

echo
