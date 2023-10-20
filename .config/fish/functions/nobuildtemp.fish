function nobuildtemp
  sudo /usr/bin/sed -i 's/^BUILDDIR=\/tmp\/makepkg/#BUILDDIR=\/tmp\/makepkg/' /etc/makepkg.conf
end
