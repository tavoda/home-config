#!/bin/bash
# "Register JDK7 for update-alternatives Script in Debian Way"
# Based on 1. codeslinger's "install_java7_alternatives" from https://gist.github.com/445930
#          2. sun-java6-plugin.deb postint script (for plugin)
# Modified by Cheng-Wei Chien<e.cwchien@gmail.com>, 2012-08-16
# ------------------------------------------------------------------------------
# Note:  This script works on x86/amd64 Debian GNU/Linux|Ubuntu.
#        If you use other arch or distro, you may have to modify some parameters.
#
# Usage: 1. Extract jdk7 tar.gz to, for example, /usr/lib/jvm/java-7-sun-1.7.0.13,
#           create a symbolic link /usr/lib/jvm/java-7-sun to it.
#        2. Download java-7-sun.jinfo from https://gist.github.com/1114515,
#           move it to /usr/lib/jvm/.java-7-sun.jinfo, do some modification if necessary.
#        3. Run this script with sudo
#        4. sudo update-java-alternatives -s java-7-sun
#        5. Have fun with jdk7!
#
# Trouble Shooting: If something goes wrong,
#        1. Uncomment "remove" commands and comment "install" commands.
#        2. Run this script again to rollback.
#        3. Fix what causes the problem, maybe typo or something else.
#        4. Comment "remove" commands and uncomment "install" commands
#        5. Run this script to update

# Force the shell to exit immediately if something goes wrong
set -e

# Follow the Debian's priority rule for java5 = 53, java6 = 63 .. I guess
priority=1080

# Your jdk7 home, in this case, it's /usr/lib/jvm/java-7-sun-1.7.0.13
# But I create a symbolic link /usr/lib/jvm/java-7-sun to meet Debian's way
basedir=/usr/lib/jvm/jdk1.7.0_15/

# Your man1 dir, you don't need to change this
mandir=$basedir/man/man1

# Variables from /usr/lib/jvm/.java-6-sun.jinfo except HtmlConverter (not in jdk7)
jdk_var='appletviewer apt extcheck idlj jar jarsigner java-rmi.cgi javac javadoc javafxpackager javah javap jconsole jdb jhat jinfo jmap jps jrunscript jsadebugd jstack jstat jstatd native2ascii rmic schemagen serialver wsgen wsimport xjc'
jre_var='ControlPanel java java_vm javaws jcontrol keytool pack200 policytool rmid rmiregistry unpack200 orbd servertool tnameserv jexec'
browser_var="xulrunner-addons firefox iceape iceweasel mozilla midbrowser xulrunner"

# Java plugin path, if your machine is x86, remeber to replace "amd64" with "i386"
plugin=$basedir/jre/lib/i386/libnpjp2.so

# First, gzip man1 files to meet the 1.gz form
files=$(ls $mandir/*.1 2> /dev/null | wc -l)
if [ "$files" != "0" ]; then
  for i in $mandir/*.1; do
    gzip $i
  done
fi

# Register jdk variables
for i in $jdk_var; do
	echo "# Updating1 $i"
  unset slave || true
  if [ -e $mandir/$i.1.gz ]; then
    slave="--slave /usr/share/man/man1/$i.1.gz $i.1.gz $mandir/$i.1.gz"
  fi
  #update-alternatives --remove $i $basedir/bin/$i
  update-alternatives --install /usr/bin/$i $i $basedir/bin/$i $priority $slave
  update-alternatives --set $i $basedir/bin/$i
done

# Register jre variables
for i in $jre_var; do
	echo "# Updating2 $i"
  unset slave || true
  if [ -e $mandir/$i.1.gz ]; then
    slave="--slave /usr/share/man/man1/$i.1.gz $i.1.gz $mandir/$i.1.gz"
  fi
  if [ $i = jexec ]; then
    #update-alternatives --remove jexec $basedir/jre/lib/jexec
    update-alternatives --install /usr/bin/jexec jexec $basedir/jre/lib/jexec $priority
    update-alternatives --set jexec $basedir/jre/lib/jexec
  else
    #update-alternatives --remove $i $basedir/jre/bin/$i
    update-alternatives --install /usr/bin/$i $i $basedir/jre/bin/$i $priority $slave
    update-alternatives --set $i $basedir/jre/bin/$i
  fi
done

# Register plugins
for i in $browser_var; do
  if [ $i = xulrunner-addons ]; then
    browser=xulrunner-1.9
  else
    browser=$i
  fi
  #update-alternatives --remove $browser-javaplugin.so $plugin
  update-alternatives --install /usr/lib/$i/plugins/libjavaplugin.so $browser-javaplugin.so $plugin $priority
done
