APPS=$(find . -mindepth 1 -maxdepth 1 -type d | xargs -n1 basename)
for APP in ${APPS[@]}; do
    stow "$APP" -t "$HOME"
done

# i3 host-specifics
if [ "$HOSTNAME" = veyron ]; then
  j4-make-config -a config_veyron solarized_light
fi

if [ "$HOSTNAME" = gandof ]; then
  j4-make-config -a config_gandof solarized_light
fi

if [ "$HOSTNAME" = nuc8 ]; then
  j4-make-config -a config_nuc8 solarized_light
fi

if [ "$HOSTNAME" = starship ]; then
  j4-make-config -a config_starship solarized_light
fi
