{ ... }:

{
  # Laptop wireless and audio devices commonly require redistributable
  # firmware that is not part of the fully free firmware set.
  hardware.enableRedistributableFirmware = true;

  services.fwupd.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
