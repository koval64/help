#!/bin/bash

GPATH=/sys/devices/pci0000\:00/0000\:00\:01.0/0000\:01\:00.0

echo ; echo "PCI Express mode (pp_dpm_pcie):"

cat $GPATH/pp_dpm_pcie

echo ; echo "GPU clock (pp_dpm_sclk):"

cat $GPATH/pp_dpm_sclk

echo ; echo "Memory clock (pp_dpm_mclk):"

cat $GPATH/pp_dpm_mclk

echo ; echo "Fan speed PWM:"

cat $GPATH/hwmon/hwmon1/pwm1

echo ; echo "Fan speed:"

cat $GPATH/hwmon/hwmon1/fan1_input

echo ; echo "Temperature:"

cat $GPATH/hwmon/hwmon1/temp1_input

