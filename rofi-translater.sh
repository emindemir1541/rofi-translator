#!/usr/bin/env bash

# Configuration
primary_language="tr"
secondary_language="en"

# Dbuss Session
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && export DISPLAY=:0 # use our own configuration

# Program
output=""
text=$(echo $output | rofi -dmenu -theme DarkBlue)
lang_code=$(/usr/bin/trans -identify <<< "$text")
lang_code=$(echo "$lang_code" | awk '/Code/{print $NF}' | sed 's/ //g')
lang_code=$(echo "$lang_code" | tr -dc '[:alnum:]\n\r' | tr '[:upper:]' '[:lower:]' )

if [[ $lang_code == *"$primary_language"* ]]; then
	output=$(/usr/bin/trans -b :$secondary_language "$text")
else
	output=$(/usr/bin/trans -b :$primary_language "$text")
fi
/usr/bin/notify-send "Translate" "$output" --urgency=low

