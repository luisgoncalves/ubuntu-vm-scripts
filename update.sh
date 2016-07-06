sudo apt-get -y remove --purge '^libreoffice.*'
sudo apt-get -y remove --purge gnome-accessibility-themes gnome-bluetooth gnome-orca gnome-screensaver gnome-sudoku gnomine onboard 'printer-driver.*' 'rhythmbox.*' shotwell thunderbird totem

sudo apt-get -y update
sudo apt-get -y dist-upgrade --force-yes

reboot