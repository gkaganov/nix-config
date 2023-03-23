{ ... }:

{
  services.xserver = {
    enable = true;
    displayManager = {
      sddm = {
        enable = true;
        autoNumlock = true;
      };
    };
    desktopManager.plasma5.enable = true;
  };
}

