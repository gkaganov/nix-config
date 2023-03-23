{ ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set number
      set relativenumber
      set noswapfile
      set expandtab
      set tabstop=2
      set shiftwidth=2
      set clipboard+=unnamedplus
      set nowrap
      set iskeyword+=-
    '';
  };
}

