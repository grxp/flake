{
  boot.kernelPatches = [
    {
      name = "fix mute LED";
      patch = ./hp_omen_mute_led_patch.patch;
    }
  ];
}
