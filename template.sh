#!/bin/bash
# ------------------------------------------------------------------
# 
# 
# ------------------------------------------------------------------

VERSION=0.2.0
SUBJECT=some-unique-id
USAGE="Usage: command -pdv args"

# --- Options processing -------------------------------------------
if [ $# == 0 ] ; then
    echo $USAGE
    exit 1;
fi

action="print"
targetdir="all"
rep="none"
mail=0

while getopts ":d:peva" optname
  do
    case "$optname" in
      "v")
        echo "Version $VERSION"
        exit 0;
        ;;
      "d")
        echo "-d argument: $OPTARG"
        directory=$OPTARG
        ;;
      "p")
        action="print"
        ;;
      "h")
        echo $USAGE
        exit 0;
        ;;
      "?")
        echo "Unknown option $OPTARG"
        exit 0;
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        exit 0;
        ;;
      *)
        echo "Unknown error while processing options"
        exit 0;
        ;;
    esac
  done

shift $(($OPTIND - 1))
