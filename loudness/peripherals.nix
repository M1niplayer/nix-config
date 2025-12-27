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
  services.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire.enable = false; # switch to when my audio eventually breaks again

  services.printing.enable = true;
}
