#!/bin/bash

cflags="-g -Wall"

while test "$1" != ""; do
  case $1 in
    -nc) cflags="$cflags -lncurses" ;;
    -pt) cflags="$cflags -pthread" ;;
    -gl) cflags="$cflags -L/usr/X11R6/lib -lglut -lGLU -lXmu -lGL -lX11 -lm" ;;
    -*) cflags="$cflags $1" ;;
    *) break ;;
  esac
  shift
done

filename=${1%.*}

shift
arguments="$@"

g++ $cflags $filename.cpp -o $filename && ./$filename $arguments