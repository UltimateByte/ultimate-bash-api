#!/bin/bash
# Name: Ultimate BASH API
# Version: 2017-06-15
# Description: Add nice pre-made functions to your bash scripts
# Developer: Robin Labadie
# Websites: lrob.fr | terageek.org

##############
## SETTINGS ##
##############

# Override scripts settings
master_settings_override="on" # on/off, override settings for all scripts using the API

# Sleep
master_sleeptime="0" # Global sleeptime settings
master_sleeptime_override="on" # on/off, force this value for all scripts using the API

# Mailing
master_mail_notifications="on" 
master_mail_notifications_override="on" # on/off, force this value for all scripts using the API
master_mail_address="root@localhost" # Global email alert address
master_mail_address_override="on" # on/off, force this value for all scripts using the API

# Logging
master_logdir="$(pwd)"

## Misc vars
function_selfname="Ultimate-Bash-API" # Name of the script
master_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))" # Name of this script file
uba_log="${logdir}/${function_selfname}.log" # Define log name


############
## SCRIPT ##
############


# TIME
SECONDS=0

## Settings override

if [ "${master_settings_override}" == "on" ]; then
	if [ "${master_sleeptime_override}" == "on" ]; then
		sleeptime="${master_sleeptime}"
	fi
	if [ "${master_mail_notifications_override}" == "on" ]; then
  		mail_notifications="${master_mail_notifications}"
	fi
	if [ "${master_mail_address_override}" == "on" ]; then
  		mail_address="${master_mail_address}"
	fi
fi

