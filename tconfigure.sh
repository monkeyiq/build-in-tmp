#!/bin/bash

PWD=`pwd`
basename=`basename $PWD`

runbootstrap=no
if [ -f configure.ac ] && [ configure.ac -nt configure ]; then 
    echo "configure.ac is newer..."
    runbootstrap=yes
fi

if [ -f macros/ferrismacros.m4 ] && [ macros/ferrismacros.m4 -nt configure ]; then
    echo "macros are newer..."
    runbootstrap=yes
fi

if [ x$runbootstrap == xyes ]; then
	echo "Running bootstrap..."
	bootstrap
fi


mkdir -p /tmp/DevelopBuild/$basename
cd /tmp/DevelopBuild/$basename
/Develop/$basename/myconfigure.sh
