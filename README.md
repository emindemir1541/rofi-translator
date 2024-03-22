# Basic Rofi Translator Script

### Requirements

- [Rofi](https://github.com/davatorium/rofi)
- [Translate Shell](https://github.com/soimort/translate-shell): Translate Client
- [Libnotify](https://gitlab.gnome.org/GNOME/libnotify): For notification

### Installation

- Clone project

	```
	 git clone  https://github.com/emindemir1541/rofi-translator.git
	```
 
- Configure  language code 

	- You can learn language code with this command

			trans -list-all
   
	- Replace it: Primary language is your target language to translate, if you write words with this language, program will use the secondary language

		```
		# Configuration
		primary_language="tr"
		secondary_language="en"
		```
  
- Set DBUSS Session for notification visibility (notification can not work if you try to run program in background) (this session is not necessary if it is working)

	- Learn DBUSS display settings

 
			echo $DBUS_SESSION_BUS_ADDRESS
   
	- Change just after the `DBUS_SESSION_BUS_ADDRESS=` part in code until `&&`

		```
		# Dbuss Session
		export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus && export DISPLAY=:0 
		```
### Usage
	./rofi-translator.sh
