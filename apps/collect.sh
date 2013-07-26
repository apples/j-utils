#!/bin/bash

function say {
	if [ ! -z $VERBOSE ]
	then
		echo $@
	fi
}

APP_DIR=

if [ -z "$APPS_DIR" ]
then
	echo "Please set APPS_DIR in collect.sh!" >&2
	exit 1
fi

while [ ! -z "$1" ]
do
	case "$1" in
		-v )
			export VERBOSE=1
			;;
		* )
			echo "Usage: $0 [-v]" >&2
			exit 1
			;;
	esac
	shift
done

cd "$APPS_DIR"
rm -rf .all
mkdir .all

for D in `ls`
do
	say "Probing $D..."
	cd "$APPS_DIR"
	if [ -d $D ]
	then
		say "Moving to $D..."
		cd "$APPS_DIR/$D"
		for F in `find .`
		do
			if [ ! -d $F ]
			then
				say "Linking $F."
				mkdir -p "$APPS_DIR/.all/`dirname $F`"
				ln -s "$APPS_DIR/$D/${F#./}" "$APPS_DIR/.all/$F"
			fi
		done
	else
		say "$D is not a directory."
	fi
done
