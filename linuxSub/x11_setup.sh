#! /bin/sh

# Need to first download X11 server, like Xming, etc
# [In app] Disable access control

# Windows setting
#  Control Panel > System and Security > Windows Defender Firewall > Advanced Settings > Inbound Rules > New Rule...
# > Program > %ProgramFiles%\VcXsrv\vcxsrv.exe > Allow the connection > checked Domain/Private/Public > Named and Confirmed Rule.

# Will fix it for now
export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"

# fix the problem and this changing, every time you login
echo "current nameserver"
cat /etc/resolv.conf

# uncomment following lines, change nameserver to the ip shown from cat
# echo "export DISPLAY=nameserver_here:0" >> ~/.bashrc
# . ~/.bashrc
