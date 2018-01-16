#!/bin/bash
git clone https://github.com/gerarddvb/Homebridge-on-RaspberryPi /home/pi/HomeKit/
apt-get update
apt-get upgrade #(I didn't do this but probably fine)
apt-get install libavahi-compat-libdnssd-dev
apt-get install nodejs
apt-get install npm
dpkg --configure -a
npm install -g --unsafe-perm homebridge
npm install -g homebridge-gpio-wpi2


addonsmenu () {
  echo "Homebridge addons:"
  echo "Press 1 to install homebridge-http"
  echo "Press 2 to install homebridge-nest"
  echo "Press 3 to install homebridge-harmonyhub"
  echo "Press 4 to install homebridge-openweathermap-temperature"
  echo "Press 5 to install homebridge-lifx-lan"
  echo "Press 6 to install all addons"
  echo "Press return to continue"
  echo "Press x to cancel script"
  read  -n 1 -p "Input Selection:" mainmenuinput
  if [ "$mainmenuinput" = "1" ]; then
          npm install -g homebridge-http

          echo ""
          echo ""
          echo "****************************"
          echo "homebridge-http installed!"
          echo "****************************"
          echo ""
          echo "Press any key to continue..."
          read -n 1
          clear
          addonsmenu

        elif [ "$mainmenuinput" = "2" ]; then
          npm install -g homebridge-nest

          echo ""
          echo ""
          echo "****************************"
          echo "homebridge-nest installed!"
          echo "****************************"
          echo ""
          echo "Press any key to continue..."
          read -n 1
          clear
          addonsmenu

        elif [ "$mainmenuinput" = "3" ]; then
          npm install -g homebridge-harmonyhub

          echo ""
          echo ""
          echo "****************************"
          echo "homebridge-harmonyhub installed!"
          echo "****************************"
          echo ""
          echo "Press any key to continue..."
          read -n 1
          clear
          addonsmenu

        elif [ "$mainmenuinput" = "4" ]; then
          npm install -g homebridge-openweathermap-temperature

          echo ""
          echo ""
          echo "****************************"
          echo "homebridge-openweathermap-temperature installed!"
          echo "****************************"
          echo ""
          echo "Press any key to continue..."
          read -n 1
          clear
          addonsmenu

        elif [ "$mainmenuinput" = "5" ]; then
          npm install -g homebridge-lifx-lan

          echo ""
          echo ""
          echo "****************************"
          echo "homebridge-lifx-lan installed!"
          echo "****************************"
          echo ""
          echo "Press any key to continue..."
          read -n 1
          clear
          addonsmenu

        elif [ "$mainmenuinput" = "6" ];then
          npm install -g homebridge-http
          npm install -g homebridge-nest
          npm install -g homebridge-harmonyhub
          npm install -g homebridge-openweathermap-temperature
          npm install -g homebridge-lifx-lan

          echo ""
          echo "****************************"
          echo "homebridge-http installed!"
          echo "homebridge-nest installed!"
          echo "homebridge-harmonyhub installed!"
          echo "homebridge-openweathermap-temperature installed!"
          echo "homebridge-lifx-lan installed!"
          echo "****************************"
          echo ""
          echo "Press any key to continue..."
          read -n 1

        elif [ "$mainmenuinput" = "" ];then
            echo "kk fam"

        elif [ "$mainmenuinput" = "x" ];then
            exit 0
        elif [ "$mainmenuinput" = "X" ];then
            exit 0
        else
            echo "You have entered an invallid selection!"
            echo "Please try again!"
            echo ""
            echo "Press any key to continue..."
            read -n 1
            clear
            addonsmenu
        fi
}

addonsmenu

homebridge

clear

gpio readall
  echo "You're going to need to make a config.json file"
  echo "I've included mine on this git."
  echo "Use the BCM number for the pin #s in the config.json file (GPIO pinout above)"
  echo "Also the 'name' : 'GPIO2' has to be one word (at least I think so..)"
  echo "You can check your .json file at: https://jsonlint.com."
  echo "Once you’re content with your config file throw it into the /home/pi/.homebridge folder."
  echo ""
  echo "Press any key to continue..."
  read -n 1
  clear

apt-get install mate-session-manager

echo "add 'dtparam=watchdog=on' as its own line, to the file that is about to open"
echo "Press any key to continue..."
read -n 1
nano /boot/config.txt
apt-get install watchdog
mv /home/pi/HomeKit/watchdog.conf /etc/
mv /home/pi/HomeKit/watchdog.service /lib/systemd/system/
systemctl enable watchdog
systemctl start watchdog
homebridge
