#!/bin/sh
mpc pause
sudo cpupower frequency-set -g performance
pacmd suspend true
#sleep 3
