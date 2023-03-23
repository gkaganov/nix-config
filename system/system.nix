{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      warn-dirty = false
    '';
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  time.timeZone = "Europe/Berlin";

  hardware.bluetooth.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;

  programs.steam.enable = true;

  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.brlaser ];
    };
  };

  system.stateVersion = "22.05";
}

