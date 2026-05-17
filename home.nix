{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "deridray";
  home.homeDirectory = "/home/deridray";

  # mimeApps
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
  "image/jpeg" = "imv.desktop";
  "image/png" = "imv.desktop";
  "image/gif" = "librewolf.desktop";
  "image/webp" = "org.gnome.eog.desktop";
  "image/heif" = "imv.desktop";
  "text/plain" = "code.desktop";
  "text/css" = "code.desktop";
  "application/x-shellscript" = "code.desktop";
  "application/x-zerosize" = "code.desktop";
  "text/html" = "librewolf.desktop";
  "x-scheme-handler/http" = "librewolf.desktop";
  "x-scheme-handler/https" = "librewolf.desktop";
  "application/pdf" = "librewolf.desktop";
  "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "chromium.desktop";
  "audio/mpeg" = "org.gnome.Decibels.desktop";
  "inode/directory" = "org.gnome.Nautilus.desktop";
  "video/mp4" = "mpv.desktop";
  "video/x-matroska" = "mpv.desktop";
  "video/webm" = "mpv.desktop";
  "video/ogg" = "mpv.desktop";
  "video/quicktime" = "mpv.desktop";
  "video/x-flv" = "mpv.desktop";
  "video/x-msvideo" = "mpv.desktop";
  "video/x-ms-wmv" = "mpv.desktop";
  "video/mpeg" = "mpv.desktop";
  };

  home.file = {
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/hypr";
    ".config/niri".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/niri";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/nvim";
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/kitty";
    ".config/yazi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/yazi";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/waybar";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/fastfetch";
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/fish";
    ".config/matugen".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/matugen";
    ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/rofi";
    ".config/spicetify".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/spicetify";
    ".config/swaync".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/swaync";
    ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles-nix/config/starship.toml";
  };

  # librewolf with pywalfox
  programs.librewolf = {
    enable = true;
    nativeMessagingHosts = [ pkgs.pywalfox-native ];;
  };
 
  # Chromium 
  programs.chromium.enable = true;

  # Git configuration (add your details)
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "deridray";
        email = "deridray@gmail.com";
      };
    };
  };
  
  # OBS for screen recording
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-gstreamer
      obs-vkcapture
    ];
    package = pkgs.obs-studio.override {
      cudaSupport = true; 
    };
  };
 
  # Video Player
  programs.mpv = {
    enable = true;
  };
  programs.rofi = {
    enable = true;
  };

  # User-specific packages
  home.packages = with pkgs; [
    prismlauncher
    yazi
    thunar
    vscode
    git
    imv
    cava
    waybar
    rofi
    awww
    btop
    brightnessctl
    hyprpicker
    hyprshot
    cliphist
    wl-clipboard
    wl-clip-persist
    pamixer
    pavucontrol
    eza
    pywalfox-native
    swaynotificationcenter
    nwg-look
    adw-gtk3
    hypridle
    hyprlock
    hyprcursor
    hyprutils
    hyprpolkitagent
    discord
    stow
    unimatrix
    spotify
    kdePackages.kamera
    gnome-clocks
    dconf-editor
    zenity
    nitch
    discord
    inputs.ayugram-desktop.packages.${pkgs.system}.ayugram-desktop
    obsidian
  ];
}
