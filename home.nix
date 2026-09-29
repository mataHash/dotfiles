{
  config,
  pkgs,
  ...
}: {
  home.username = "mata";
  home.homeDirectory = "/home/mata";

  home.stateVersion = "26.05";
  home.file.".config/hypr".source = ./hypr;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      guess-indent-nvim
      gitsigns-nvim
      which-key-nvim
      tokyonight-nvim
      todo-comments-nvim
      mini-nvim
      plenary-nvim
      telescope-nvim
      telescope-ui-select-nvim
      fidget-nvim
      conform-nvim
      luasnip
      friendly-snippets
      nvim-treesitter
      indent-blankline-nvim
      neo-tree-nvim
      nui-nvim
      nvim-dap
      nvim-dap-ui
      nvim-nio
      nvim-dap-go
      nvim-autopairs
      nvim-lint
      blink-cmp
    ];
  };
  home.file.".config/nvim".source = ./nvim;
  home.file.".config/waybar".source = ./waybar;

  programs.git = {
    enable = true;

    userName = "Jorysniel Mata Nunez";
    userEmail = "matajorysniel@gmail.com";

    settings = {
      core.editor = "nvim";
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;

    settings = {
      git_protocol = "https";
      prompt = "enabled";
      prefer_editor_prompt = "disabled";

      aliases = {
        co = "pr checkout";
      };
      color_labels = "enabled";
      accessible_colors = "enabled";
      accessible_prompter = "disabled";
      spinner = "enabled";
    };
  };
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      PS1="\e[0;36m''\$ \e[m "
      fastfetch
    '';
    shellAliases = {
      ll = "ls -l";
    };
  };
  home.packages = with pkgs; [
    font-awesome
  ];
}
