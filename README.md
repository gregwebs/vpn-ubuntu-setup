# vpn-ubuntu-setup

This worked on Ubuntu 16.04 until I did an update

And addesd systemd service to restart networking as per
* http://askubuntu.com/questions/629258/network-manager-must-be-restarted-after-wakeup-in-ubuntu-15-04
* http://askubuntu.com/questions/761180/wifi-doesnt-work-after-suspend-after-16-04-upgrade
/etc/systemd/system/suspend.target.wants/nm-resume.service -> vpn/nm-resume.service

sudo ln -s vpn/vpn-suspend-fix /lib/systemd/system-sleep/vpn-suspend-fix

