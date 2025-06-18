#!/bin/bash
echo "Theme Picker zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
hyprctl reload

source /home/luisarris/.config/luis-config/colors
    export color1 color2 color3 color4 color5 color15 color16 color17 color18 color19 color20 color21




gray_wallpaper="/home/luisarris/.config/luis-config/gray-rofi-theme/Evangelion.png"
beige_wallpaper="/home/luisarris/.config/luis-config/beige-rofi-theme/Lady.png"
wallust_config="/home/luisarris/.config/wallust/wallust.toml"
wallpaper="/home/luisarris/.config/rofi/.current_wallpaper"
scriptsluis="/home/luisarris/.config/luis-config/scriptsluis/"


#solo wallpaper y wallust, wallust es mala idea por los cambios de colores en wallust-hyprland.conf
set_wallpaper() {
    local wallpaper="$1"
    if [ -f "$wallpaper" ]; then
       
        pkill swaybg
        # Swallpaper nuevo
        swaybg -i "$wallpaper" -m fill &
        # actualizar wallust y los colores
        #wallust run "$wallpaper"
        #echo "wallpaper set to $wallpaper and colors updated"
    else
        echo "Error: wallpaper file not found at $wallpaper"
        exit 1
    fi
}

if [[ "$1" == "beige" ]]; then
#theme beige
hyprctl --batch "\
    keyword general:col.active_border $color19;\
    keyword general:col.inactive_border $color20;\
    keyword general:gaps_out 5"




# source y destino
SOURCE="/home/luisarris/.config/luis-config/test/beige/wallust-hyprland.conf"
DEST="/home/luisarris/.config/hypr/wallust/"

# existe?
if [ -f "$SOURCE" ]; then

  # cp
    cp "$SOURCE" "$DEST/" || {
        echo "ailed to copy $SOURCE to $DEST"
        exit 1
    }
    echo "successfully copied $SOURCE to $DEST"
else
    echo " source file $SOURCE does not exist"
    exit 1
fi


#rofi theme
beige_theme="/home/luisarris/.config/luis-config/beige-rofi-theme/beige.rasi"
current_theme="/home/luisarris/.config/rofi/config.rasi"

    if [ -f "$beige_theme" ]; then
        cp "$beige_theme" "$current_theme" || {
        echo "could not switch to beige theme"
        exit 1
        }
        echo switched to beige theme lol
    else
        echo could not switch to beige theme
        exit 1
    fi

#set_wallpaper "$beige_wallpaper"
$scriptsluis/wallpaper.sh
fi

#aqui es el otro t hemeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee

#theme gray
if [[ "$1" == "gray" ]]; then
hyprctl --batch "\
    keyword general:col.active_border $color17;\
    keyword general:col.inactive_border $color18;\
    keyword general:gaps_out 5"

$scriptsluis/wallpapergray.sh

# source yd estino
SOURCE="/home/luisarris/.config/luis-config/test/wallust-hyprland.conf"
DEST="/home/luisarris/.config/hypr/wallust/"

# exsite?
if [ -f "$SOURCE" ]; then

  # cp
    cp "$SOURCE" "$DEST/" || {
        echo "failed to copy $SOURCE to $DEST"
        exit 1
    }
    echo "successfully copied $SOURCE to $DEST"
else
    echo "source file $SOURCE does not exist"
    exit 1
fi



#rofi theme
gray_theme="/home/luisarris/.config/luis-config/gray-rofi-theme/gray.rasi"
current_theme="/home/luisarris/.config/rofi/config.rasi"

    if [ -f "$gray_theme" ]; then
    

        cp "$gray_theme" "$current_theme" || {
        echo "could not switch to gray theme"
        exit 1
        } 
        echo "switched to gray theme"
    else
        echo "could not switch to gray theme, $gray_theme does nto exist"
        exit 1
    fi

fi



