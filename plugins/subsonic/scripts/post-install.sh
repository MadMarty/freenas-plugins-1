#!/bin/sh
#########################################

subsonic_pbi_path=/usr/pbi/subsonic-$(uname -m)

${subsonic_pbi_path}/bin/python2.7 ${subsonic_pbi_path}/subsonicUI/manage.py syncdb --migrate --noinput

# Install DejaVu fonts if they don't exist
if [ ! -d /usr/local/lib/X11/fonts/dejavu ]; then
	fetch "http://sourceforge.net/projects/dejavu/files/dejavu/2.34/dejavu-fonts-ttf-2.34.tar.bz2"
	tar xjf dejavu-fonts-ttf-*.tar.bz2
	mv dejavu-fonts-ttf-*/ttf /usr/local/lib/X11/fonts/dejavu
	rm -r dejavu-fonts-ttf-*
fi
# Install fonts config if it doesn't exist
if [ ! -f /usr/local/etc/fonts/fonts.conf ]; then
	mkdir -p /usr/local/etc/fonts
	cat << __EOF__ > /usr/local/etc/fonts/fonts.conf
<?xml version="1.0"?>
<fontconfig>
	<dir>/usr/local/lib/X11/fonts</dir>
</fontconfig>
__EOF__
fi
