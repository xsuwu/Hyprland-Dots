#!/bin/bash

# Display a list dialog with options
selection=$(zenity --list \
  --title="Choose" \
  --text="Theme Selectore:" \
  --column="Themes" \
  "beige" \
  "gray" \
  --width=900 \
  --height=300)

#colores para bordes
source /home/luisarris/.config/luis-config/colors
    export color1 color2 color3 color4 color5 color15 color16 color17 color18 color19 color20 color21



#variables
gray_wallpaper="/home/luisarris/.config/luis-config/gray-rofi-theme/Evangelion.png"
beige_wallpaper="/home/luisarris/.config/luis-config/beige-rofi-theme/Lady.png"
wallust_config="/home/luisarris/.config/wallust/wallust.toml"
wallpaper="/home/luisarris/.config/rofi/.current_wallpaper"
scriptsluis="/home/luisarris/.config/luis-config/scriptsluis/"
nordicdarker="Nordic-darker"
gruvboxdarker="Gruvbox-Dark-Medium"
nordwallpaper="/home/luisarris/.config/luis-config/nordcosas/Nord.png"


# Check if the user made a selection or cancelled
if [ $? -eq 0 ]; then
    echo "You selected: $selection"
    case $selection in
        "beige")
            echo "Running Option 1 tasks..."
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

                        
                        
                 #cambiar el gtk theme
                    echo "Setting GTK theme to $gruvboxdarker"
                    gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox-Dark-Medium"
                    

                    # Export settings to ~/.config/gtk-3.0/settings.ini for XWayland compatibility
                    echo "Exporting settings to ~/.config/gtk-3.0/settings.ini"
                    nwg-look -x

                    # Verify the theme was applied
                    CURRENT_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
                    if [ "$CURRENT_THEME" == "'$gruvboxdarker'" ]; then
                        echo "Successfully changed GTK theme to $gruvboxdarker"
                     else
                        echo "Error: Failed to change GTK theme. Current theme is $gruvboxdarker"
                        exit 1
                    fi
                
            ;;
        "gray")
            echo "Running Option 2 tasks..."
                #theme gray
            
                hyprctl --batch "\
                    keyword general:col.active_border $color17;\
                    keyword general:col.inactive_border $color18;\
                    keyword general:gaps_out 5"

                $scriptsluis/wallpapernord.sh

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

                #cambiar el gtk theme a nordic osea, gris
                        echo "Setting GTK theme to $nordicdarker"
                        gsettings set org.gnome.desktop.interface gtk-theme "Nordic-darker"
                    

                        # Export settings to ~/.config/gtk-3.0/settings.ini for XWayland compatibility
                        echo "Exporting settings to ~/.config/gtk-3.0/settings.ini"
                        nwg-look -x

                        # Verify the theme was applied
                        CURRENT_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
                        if [ "$CURRENT_THEME" == "'$nordicdarker'" ]; then
                            echo "Successfully changed GTK theme to $nordicdarker"
                        else
                            echo "Error: Failed to change GTK theme. Current theme is $CURRENT_THEME"
                            exit 1
                        fi

exit 0
            
            echo "Invalid selection"
    
    esac
else
    echo "No selection made."
fi