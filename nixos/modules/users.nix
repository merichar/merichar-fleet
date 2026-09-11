{ ... }:

{
  users.users.merichar = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
