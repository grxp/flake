{ pkgs, ... }:
{
  users.users.root.initialHashedPassword = "$y$j9T$pBWWxRVg6x9fa/1cZekGW1$hb.Vg3hwXSat17adx16GhwBdkJaQlKv.iib5pyjO/z1";
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.darkair = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "DarkAir";
    initialHashedPassword = "$y$j9T$pBWWxRVg6x9fa/1cZekGW1$hb.Vg3hwXSat17adx16GhwBdkJaQlKv.iib5pyjO/z1"; # set password directly
    extraGroups = [
      "networkmanager"
      "wireshark"
      "wheel"
    ];
  };
}
