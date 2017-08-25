#!/bin/sh

if [ -z $DST ]; then
     echo "DST is empty"
      exit 1
  fi


  echo "starting streaming backup"
  innobackupex --host=${SRC} --user=${XTRABACKUP_USER} --password=${XTRABACKUP_PASSWORD} --stream=tar ./ | nc $DST 9999
