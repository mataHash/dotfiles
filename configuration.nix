{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

 nix.settings.experimental-features = [ "nix-command" "flakes"];
  # Use the systemd-boot EFI boot loader.
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

   users.users.jorys = {
     isNormalUser = true;
     extraGroups = [ "network-manager" "wheel" ]; # Enable ‘sudo’ for the user.
   };

   programs.firefox.enable = true;

   hardware.graphics.enable = true;
   programs.uwsm = {
   	enable = true;
	waylandCompositors = {
	hyprland
	};
   }; 
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
     imv
     zathura
     git
     lynx
     ddgr
     kitty
     brightnessctl
     brave
     tmux
     wl-clipboard
     github-cli
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

