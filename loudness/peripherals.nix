# hardware ish related stuff

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Useful for hardware. Probably TODO check if I need this
  hardware.enableAllFirmware = true;
  hardware.amdgpu.opencl.enable = true;

  # audio on linux!!!
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  # TIL: systemd config i home directory kan ha broken symlinks
  # .config/systemd/user/*
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; #audio almost works
    wireplumber.enable = true;
    # If you want to use JACK applications, uncomment the following
    jack.enable = true;
  };
  services.printing.enable = true;
}
