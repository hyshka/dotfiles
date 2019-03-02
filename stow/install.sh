APPS=$(find . -mindepth 1 -maxdepth 1 -type d | xargs -n1 basename)
for APP in ${APPS[@]}; do
    stow "$APP" -t "$HOME"
done

# i3 host-specifics
if [ "$HOSTNAME" = veyron ]; then
  j4-make-config -a config_veyron solarized_light
  ln -s ~/dotfiles/i3/i3status_veyron ~/.config/i3/i3status.conf
fi

if [ "$HOSTNAME" = gandof ]; then
  j4-make-config -a config_gandof solarized_light
  ln -s ~/dotfiles/i3/i3status_gandof ~/.config/i3/i3status.conf
fi
