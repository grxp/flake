{ inputs
, user
, system
, ...
}:
{
  # Nixpkgs Allow packages
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-27.3.11"
  # ];

  # home-manager.useGlobalPkgs = true; # overlays globalpkgs using nur
  home-manager.useUserPackages = true;
  home-manager.users.${user} = import ./user/home.nix;
  home-manager.backupFileExtension = "backup";
  home-manager.extraSpecialArgs = {
    inherit inputs user system;
  };

}
