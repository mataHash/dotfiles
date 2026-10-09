{pkgs, ...}: {
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
  home.file.".config/kitty".source = ./kitty;

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
      __git_ps1() { :; }

      PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null);
      PS1="\[\e[38;5;32m\]\d\[\e[0m\] \t-[\[\e[36m\]\u\[\e[0m\]@\[\e[38;5;230m\]\h\[\e[0m\]]-(\[\e[38;5;26m\]\w\[\e[0m\])-''${PS1_CMD1:+"($PS1_CMD1)"}\n\[\e[38;5;31m\]\$\[\e[0m\]"'
    '';
    shellAliases = {
      ll = "ls -l";
    };
  };
  home.packages = with pkgs; [
    font-awesome
  ];
}
