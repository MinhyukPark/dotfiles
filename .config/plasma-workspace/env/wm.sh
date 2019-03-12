# Disable KWin and use i3gaps as WM
export KDEWM=/usr/bin/i3

# Compositor (Animations, Shadows, Transparency)
# xcompmgr -C
dbus-launch compton -b --config ~/.config/compton/compton.conf --blur-background
