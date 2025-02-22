{
  user,
  lib,
  options,
  ...
}:
{
  config =
    {
      # rtkit is optional but recommended
      security.rtkit.enable = true;
      # Pipewire
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
      };

      services.pulseaudio.enable = false;
    }
    // lib.optionalAttrs (options ? "home-manager") {
      home-manager.users.${user}.xdg.configFile."wireplumber/wireplumber.conf.d/51-disable-suspension.conf".text =
        ''
          monitor.alsa.rules = [
            {
              matches = [
                {
                  # Matches all sinks
                  node.name = "~alsa_output.*Speaker"
                }
              ]
              actions = {
                update-props = {
                  session.suspend-timeout-seconds = 0
                  dither.method = "wannamaker3", # add dither of desired shape
                  dither.noise = 15, # add additional bits of noise
                }
              }
            }
          ]'';
    };
}
