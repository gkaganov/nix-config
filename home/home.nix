{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  systemd.user.startServices = true;

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    rofi = {
      enable = true;
      theme = "Arc";
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = [
        pkgs.vscode-extensions.ms-vscode.cpptools
      ];
    };
  };

  home = {
    packages = with pkgs; [
      unzip
      libreoffice
      nodejs
      nodePackages.pnpm
      clang
      racket
      tdesktop # telegram
      xclip
      firefox # librewolf
      chromium
      openvpn
      teams
      git
      spotify
      oath-toolkit
      maven
      jdk8
      docker-compose
      jetbrains.idea-ultimate
      brave
      freetube
      shutter
      element-desktop
    ];

    stateVersion = "22.05";
  };
}

