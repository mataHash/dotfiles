{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Santo_Domingo";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.mata = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "vboxusers" "wheel" "kvm" "input"];
  };
  nixpkgs.config.allowUnfree = true;

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  programs.firefox.enable = true;
  hardware.graphics.enable = true;
  programs.uwsm.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  services.libinput.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  environment.sessionVariables = {
    XDG_PICTURES_DIR = "$HOME/Pictures";
    QT_QPA_PLATFORM = "wayland;xcb";
    GDK_BACKEND = "wayland,x11";
    _JAVA_AWT_OBNX_WM_NONREPARENTING = "1";
  };
  environment.systemPackages = with pkgs; [
    wl-clipboard
    tree
    wget
    neovim
    curl
    gawk
    jq
    ffmpeg
    vlc
    proton-vpn
    kdePackages.kdeconnect-kde
    imv
    zathura
    git
    lynx
    ddgr
    kitty
    hyprpicker
    brightnessctl
    brave
    tmux
    wl-clipboard
    cliphist
    github-cli
    ripgrep
    fd
    tree-sitter
    gcc
    nil
    alejandra
    lua-language-server
    stylua
    gnumake
    unzip
    markdownlint-cli
    grim
    slurp
    fastfetch
    nerd-fonts.fira-code
    docker
    kubectl
    k3s
    qemu
    swtpm
    quickemu
    base16-schemes
    bitwarden-cli
    ags
    pandoc
    fuzzel
    waybar
    localsend
    syncthing
    dunst
    swayosd
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.stateVersion = "26.05";
}
