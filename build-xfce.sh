#!/bin/sh

# Copyright 2012  Patrick J. Volkerding, Sebeka, Minnesota, USA
# All rights reserved.
#
# Copyright 2013 Chess Griffin <chess.griffin@gmail.com> Raleigh, NC
# Copyright 2013 Willy Sudiarto Raharjo <willysr@slackware-id.org>
# All rights reserved.
#
# Based on the xfce-build-all.sh script by Patrick J. Volkerding
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Modified again by Eric Fernandes Ferreira <candelabrus@gmail.com> for my personal Xfce Project

# Set to 1 if you'd like to install/upgrade package as they are built.
# This is recommended.
INST=1

# This is where all the compilation and final results will be placed
TMP=${TMP:-/tmp}

# This is the original directory where you started this script
XSBROOT=$(pwd)

# Loop for all base packages
for dir in \
  glade \
  gtksourceview \
  gnome-icon-theme \
  dmz-cursor-theme \
  xfce4-dev-tools \
  libxfce4util \
  xfconf \
  libxfce4ui \
  exo \
  garcon \
  tumbler \
  thunar \
  xfce4-panel \
  xfce4-settings \
  xfce4-session \
  xfdesktop \
  xfwm4 \
  xfce4-appfinder \
  gtk-xfce-engine \
  murrine \
  Greybird \
  vte3 \
  xfce4-terminal \
  orage \
  mm-common \
  pavucontrol \
  xfce4-pulseaudio-plugin \
  thunar-volman \
  xfce4-power-manager \
  xfce4-notifyd \
  xfce4-volumed-pulse \
  libxnvctrl \
  xfce4-sensors-plugin \
  xfce4-clipman-plugin \
  xfce4-cpufreq-plugin \
  xfce4-cpugraph-plugin \
  xfce4-screenshooter \
  xfce4-systemload-plugin \
  xfce4-taskmanager \
  xfce4-weather-plugin \
  mousepad \
  ristretto \
  xarchiver \
  thunar-archive-plugin \
  thunar-media-tags-plugin \
  ; do
  # Get the package name
  package=$(echo $dir | cut -f2- -d /)

  # Change to package directory
  cd $XSBROOT/$dir || exit 1

  # Get the version
  version=$(cat ${package}.SlackBuild | grep "VERSION:" | head -n1 | cut -d "-" -f2 | rev | cut -c 2- | rev)

  # Get the build
  build=$(cat ${package}.SlackBuild | grep "BUILD:" | cut -d "-" -f2 | rev | cut -c 2- | rev)

  # The real build starts here
  sh ${package}.SlackBuild || exit 1
  if [ "$INST" = "1" ]; then
    PACKAGE=$(ls $TMP/${package}-${version}-*-${build}*.txz 2>/dev/null)
    if [ -f "$PACKAGE" ]; then
      upgradepkg --install-new --reinstall "$PACKAGE"
    else
      echo "Error:  package to upgrade "$PACKAGE" not found in $TMP"
      exit 1
    fi
  fi
# mv $PACKAGE /home/backup/app/slackware/xfce/install/
  # back to original directory
  cd $XSBROOT
done
