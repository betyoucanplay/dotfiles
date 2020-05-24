#!/bin/sh
sudo cpupower frequency-set -g powersave
pacmd suspend false
a2j_control exit
