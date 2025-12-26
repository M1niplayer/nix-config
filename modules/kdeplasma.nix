# display server + plasma, could split into two
{
    services.xserver.enable = true;
    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "se";
        variant = "";
        options = "grp:lctrl_lwin_toggle";
    };
    # touchpad
    # services.xserver.libinput.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Configure console keymap
    console.keyMap = "sv-latin1";
}