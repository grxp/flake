{ user, pkgs, ... }:
{
  users.users.root.initialHashedPassword = "$y$j9T$pBWWxRVg6x9fa/1cZekGW1$hb.Vg3hwXSat17adx16GhwBdkJaQlKv.iib5pyjO/z1";
  users.users.${user} = {
    description = "DarkAir";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "tss"
      "networkmanager"
      "docker"
      "libvirtd"
      "wireshark"
      "adbusers"
    ]; # Enable ‘sudo’ for the user.
    initialHashedPassword = "$y$j9T$pBWWxRVg6x9fa/1cZekGW1$hb.Vg3hwXSat17adx16GhwBdkJaQlKv.iib5pyjO/z1"; #set password directly
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEPGyo645eOcXewfKZ5Gbpl7Hc2FIGYZdKBue4RD3hpj public@PC" ];
  };
}
