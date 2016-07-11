#!/bin/bash
# Tobias Klein, 02/2009
# http://www.trapkit.de

# help
if [ "$#" = "0" ]; then
  echo "usage: checkrelro OPTIONS"
  echo -e "\t--file <binary name>"
  echo -e "\t--dir <directory name>"
  echo -e "\t--proc <process name>"
  echo -e "\t--proc-all"
  echo
  exit 1
fi

# check if a file supports RELRO
bincheckrelro() {
  if readelf -l $1 2>/dev/null | grep -q 'GNU_RELRO'; then
    if readelf -d $1 2>/dev/null | grep -q 'BIND_NOW'; then
      echo -n -e '\033[32mfull RELRO\033[m'
    else
      echo -n -e '\033[33mpartial RELRO\033[m'
    fi
  else
    echo -n -e '\033[31mno RELRO\033[m'
  fi
}

# check if a process supports RELRO
proccheckrelro() {
  if readelf -l $1/exe 2>/dev/null | grep -q 'Program Headers'; then
    if readelf -l $1/exe 2>/dev/null | grep -q 'GNU_RELRO'; then
      if readelf -d $1/exe 2>/dev/null | grep -q 'BIND_NOW'; then
        echo -n -e '\033[32mfull RELRO\033[m'
      else
        echo -n -e '\033[33mpartial RELRO\033[m'
      fi
    else
      echo -n -e '\033[31mno RELRO\033[m'
    fi
  else
    echo -n -e '\033[31mPermission denied\033[m'
  fi
}

if [ "$1" = "--dir" ]; then
  cd /$2
  for I in [a-z]*; do
    if [ "$I" != "[a-z]*" ]; then
      echo -n -e $I
      echo -n -e ' - '
      bincheckrelro $I
      echo
    fi
  done
  exit 0
fi

if [ "$1" = "--file" ]; then
  echo -n -e $2
  echo -n -e ' - '
  bincheckrelro $2
  echo
  exit 0
fi

if [ "$1" = "--proc-all" ]; then
  cd /proc
  for I in [1-9]*; do
    if [ $I != $$ ] && readlink -q $I/exe > /dev/null; then
      echo -n -e `head -1 $I/status | cut -b 7-`
      echo -n -e ' ('			
      echo -n -e $I
      echo -n -e ') - '
      proccheckrelro $I
      echo
    fi
  done
  exit 0
fi

if [ "$1" = "--proc" ]; then
  cd /proc
  for I in `pidof $2`; do
    if [ -d $I ]; then
      echo -n -e $2
      echo -n -e ' ('			
      echo -n -e $I
      echo -n -e ') - '
      proccheckrelro $I
      echo
    fi
  done
fi
