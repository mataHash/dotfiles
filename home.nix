{ config, pkgs, ...}:

{
  home.username = "jorys";
  home.homeDirectory = "/home/jorys";

  home.stateVersion = "26.05";
  home.file.".config/hypr".source = ./hypr;
}
