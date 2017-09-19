if [ -e usr/share/icons/DMZ-White/icon-theme.cache ]; then
  if [ -x /usr/bin/gtk-update-icon-cache ]; then
    /usr/bin/gtk-update-icon-cache usr/share/icons/DMZ-White >/dev/null 2>&1
  fi
fi

