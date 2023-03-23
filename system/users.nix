{ pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.fish;
    users.gkaganov = {
      isNormalUser = true;
      description = "Grigori Kaganov";
      extraGroups = [ "networkmanager" "wheel" "docker" "vboxusers" ];
    };
  };
}

