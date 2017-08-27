# ultimate-bash-api
Add nice pre-made functions to your bash scripts

# How to use

1) Add these lines at the beginning of your code, after setting your basic variables :

````bash
# Download bash API
if [ ! -f "ultimate-bash-api.sh" ]; then
	wget https://raw.githubusercontent.com/UltimateByte/ultimate-bash-api/master/ultimate-bash-api.sh
	chmod +x ultimate-bash-api.sh
fi
source ultimate-bash-api.sh
````

2) Enjoy using functions in your code

### fn_echo "Your text here"
Will echo your text with a nice form

### fn_logecho "Your text here"
Will echo your text with a nice form to the log file

### fn_mail
After defining the "mailsubject" and "mailcontent" vars, will send a mail to the contact email set into the API (mailto_address)

### fn_mail_currlog
Will send the latest log to the given address

### fn_duration
Will output the past duration since the api was sourced (typically in the early moments of your script)


## More to come, work in progress
