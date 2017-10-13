#/!/bin/zsh

# max brightness = 2
sudo tee /sys/class/leds/tpacpi::kbd_backlight/brightness <<< 2

