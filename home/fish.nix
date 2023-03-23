{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    plugins = [
      { name = "pure"; src = pkgs.fishPlugins.pure.src; }
    ];
    loginShellInit = ''
      systemctl --user restart polybar
    '';
    interactiveShellInit = ''
      function rebuild
        pushd /etc/nixos
        git commit -am "config"
        nix fmt
        git commit -am "reformat"
        nix flake update --commit-lock-file /etc/nixos
        sudo nixos-rebuild switch
        systemctl --user restart emacs
        popd
      end
    '';
    shellAliases = {
      mvn-build = "mvn -DskipTests=true clean flatten:clean flatten:flatten install -Denforcer.skip=true -f pom.xml -U";
    };
  };
}

