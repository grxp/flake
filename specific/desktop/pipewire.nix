{ pkgs-stable, ... }:

{
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  # Pipewire
  services.pipewire = {
    enable = true;
    package = pkgs-stable.pipewire;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  services.pipewire.wireplumber.extraConfig."99-disable-suspend" = {
    "monitor.alsa.rules" = [
      {
        matches = [
          {
            "node.name" = "~alsa_output.*Speaker";
          }
        ];
        actions = {
          update-props = {
            "session.suspend-timeout-seconds" = 0;
            "dither.method" = "wannamaker3";
            "dither.noise" = 15;
          };
        };
      }
    ];
  };

}
