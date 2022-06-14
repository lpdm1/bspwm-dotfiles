#use arandr to find your configuration.
#Open arandr and when you're done, go to Layout, save it somewhere and copy its content and replace the line below.
xrandr --output DVI-I-0 --primary --mode 1600x900 --pos 0x0 --rotate normal --output DVI-I-1 --off --output HDMI-0 --off --output DVI-D-0 --mode 1440x900 --pos 1600x0 --rotate normal

# Lauch notification daemon
dunst \
-geom "280x50-10+42" -frame_width "1" -font "Iosevka Custom 9" \
-lb "$BACKGROUND" -lf "$FOREGROUND" -lfr "$BLUE" \
-nb "$BACKGROUND" -nf "$FOREGROUND" -nfr "$BLUE" \
-cb "$BACKGROUND" -cf "$RED" -cfr "$RED" &

# Lauch xsettingsd daemon
xsettingsd &

# Polkit agent
if [[ ! `pidof xfce-polkit` ]]; then
	/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
fi

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Enable power management
xfce4-power-manager &

# Fix cursor
xsetroot -cursor_name left_ptr

# Restore wallpaper
bash $HOME/.fehbg

# Start mpd
exec mpd &

# Lauch keybindings daemon
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &