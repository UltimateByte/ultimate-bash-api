#!/bin/bash
# Name: Ultimate BASH API
# Version: 2017-08-08
# Description: Add nice pre-made functions to your bash scripts
# Developer: Robin Labadie
# Websites: lrob.fr | haisoft.fr | terageek.org

## Misc vars
function_nicename="Ultimate-Bash-API" # Name of the script
function_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))" # Name of this script file
function_rootdir="$(dirname $(readlink -f "${BASH_SOURCE[0]}"))"

##############
## SETTINGS ##
##############

# Sleep
sleeptime="0" # Sleeptime settings

# Mailing
mail_notifications="on" 
mailto_address="root@localhost" # Recipient mail alert address

# Logging
logdir="${function_rootdir}/log/" # Directory in which to save logs
if [ -n "${selfname}" ]; then
	log="${logdir}/${selfname}.log"
else
	log="${logdir}/${function_nicename}.log"
fi

############
## SCRIPT ##
############

# TIME
SECONDS=0

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

# Displays the duration since you executed this script
fn_duration(){
	duration=$SECONDS
	echo "[INFO] $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
}

# Create log files
fn_logging
