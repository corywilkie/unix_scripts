#!/bin/bash

i=0
while true;
do
  
  ping -c 1 10.0.1.1
  if [ $? -eq 0 ]
  then 
    i=0 #Pass
    echo '10.0.1.1 Pass i='$i
  else
    ((i++)) #Fail
    echo '10.0.1.1 Fail i='$i
  fi
  sleep 60
  
  ping -c 1 10.0.1.5
  if [ $? -eq 0 ]
  then 
    i=0 #Pass
    echo '10.0.1.5 Pass i='$i
  else
    ((i++)) #Fail
    echo '10.0.1.5 Fail i='$i
  fi
  sleep 60
  
  ping -c 1 8.8.8.8
  if [ $? -eq 0 ]
  then 
    i=0 #Pass
    echo '8.8.8.8 Pass i='$i
  else
    ((i++)) #Fail
    echo '8.8.8.8 Fail i='$i
  fi
  sleep 60

  if [ $i -gt 10 ]
  then
    /sbin/powerdown
  fi
    
done
