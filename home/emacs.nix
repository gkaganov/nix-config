{ ... }:

{
  services.emacs.enable = true;
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      evil
      color-theme-sanityinc-tomorrow
      racket-mode
      json-mode
      vterm
      nix-mode
      helm-nixos-options
    ];
    extraConfig = ''
      ;; vim keys
      (require 'evil)
      (evil-mode 1)
 
      ;; disable some ugly buttons
      (tool-bar-mode -1)
      (scroll-bar-mode -1)

      ;; nice theme and font
      (require 'color-theme-sanityinc-tomorrow)
      (custom-set-variables '(custom-enabled-themes 'color-theme-sanityinc-tomorrow))
      (add-to-list 'default-frame-alist '(font . "Fira Code-16:style=Light"))

      ;; nix support
      (require 'nix-mode)
      (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

      ;; nix options suggestions
      (global-set-key (kbd "C-c C-S-n") 'helm-nixos-options)

      ;; racket support
      (require 'racket-mode)
      (require 'racket-xp) ; improved racket syntax highlighting
      (add-hook 'racket-mode-hook #'racket-xp-mode) ; use racket xp automatically
 
      ;; also autocomplete with tab
      (setq tab-always-indent 'complete)
    '';
  };
}

