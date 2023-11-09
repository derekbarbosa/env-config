#!/bin/bash

insmod kthread-noise/kthread-noise.ko

sleep 30

while :
  do
    ipmitool power diag
  done
