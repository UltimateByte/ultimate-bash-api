#!/bin/bash
# Name: Ultimate BASH API
# Version: 2017-06-15
# Description: Add nice pre-made functions to your bash scripts
# Developer: Robin Labadie
# Websites: lrob.fr | terageek.org

## Misc vars
api_selfname="Ultimate-Bash-API" # Name of the script
master_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))" # Name of this script file
master_rootdir="$(dirname $(readlink -f "${BASH_SOURCE[0]}"))"
uba_log="${logdir}/${function_selfname}.log" # Define log name

##############
## SETTINGS ##
##############

# Sleep
sleeptime="0" # Sleeptime settings

# Mailing
mail_notifications="on" 
mailto_address="root@localhost" # Recipient mail alert address

# Logging
logdir="${master_rootdir}/log/" # Directory in which to save logs
log="${logdir}/${api_selfname}.log"

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

fn_logging(){
	if [ -n "${logdir}" ]&&[ ! -d "${logdir}" ]; then
		mkdir -pv "${logdir}"
	fi
	# Create logfile
	if [ -n "${log}" ]&&[ ! -f "${log}" ]; then
		touch "${log}"
	fi
}

# Give a form to echo messages
fn_echo_form(){
	echoform="$(date +%Y-%m-%d_%H:%M:%S) - ${selfname} - ${currmessage}"
}

# Simple echo with date and selfname
# Usage fn_echo "Your Message"
fn_echo(){
	currmessage="$1"
	fn_echo_form
	echo -e "${echoform}"
}

# Echo with date and output to log at the same time
# Usage fn_logecho "Your Message"
fn_logecho(){
	currmessage="$1"
	fn_echo_form
	echo -e "${echoform}"
	echo -e "${echoform}" >> "${log}"
	currlog="${currlog}${echoform}\n"
}

# Send mail notification
# Define mailsubject to your mail subject
# Define mailcontent to your mail body message
fn_mail(){
	if [ "${mailalert}" == "yes" ]; then
		fn_logecho "[INFO] Sending mail alert to: ${mailaddress}"
		echo -e "${mailcontent}" | mail -s "$(hostname -s) - ${mailsubject}" ${mailto_address}
	fi
}

# Send mail containing all current log
fn_mail_currlog(){
	if [ "${mailalert}" == "yes" ]; then
		fn_logecho "[INFO] Sending mail alert to: ${mailaddress}"
		echo -e "${currlog}" | mail -s "$(hostname -s) - ${mailsubject}" ${mailto_address}
	fi
}

# Create log files
fn_logging
