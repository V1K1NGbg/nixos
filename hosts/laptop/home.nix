{ config, pkgs, ... }:

{
  # imports =
  #   [
  #     ./../../modules/nixos/autorandr.nix
  #   ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "victor";
  home.homeDirectory = "/home/victor";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/victor/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # programs.autorandr = {
  #   enable = true;
  #   profiles =
  #     let
  #       home = "00ffffffffffff003669a83c01010101021e0104b53c2278ff85d5ae4f47a726105054bfcf0081809500b30001010101010101010101565e00a0a0a029503020350055502100001e000000fd0030a5f2f241010a202020202020000000fc004d5349204d414732373251520a000000ff004341384131393030323032373301b102033b714a01020304901112131f3f230917078301000067030c001000383c67d85dc401788000681a0000010330a500e305c000e606050157572b00fa0050a0a01f500a3c350055502100001ef3db0064a0a01e501220080455502100001a249680be703818403f20a80055502100001e0000000000000000000000000000af";
  #       laptop = "00ffffffffffff0030e4900600000000441e0104a5221378030004000000000000515600000001010101010101010101010101010101bc6100a0a0a05d503020350058c21000001a000000fd0c3cf0717165010a202020202020000000fe00484d483259813135365148470a000000000002813fa8000300000f010a202001f67013790000030114ea860184ff099f002f801f009f055c0002000400810309681a000001013cf0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000af90";
  #     in {
  #       "home" = {
  #         fingerprint = {
  #           DP-1 = home;
  #           eDP-1 = laptop;
  #         };
  #         config = {
  #           DP-1 = {
  #             enable = true;
  #             primary = true;
  #             # position = "0x0";
  #             # mode = "2560x1440";
  #             # rate = "60.00";
  #           };
  #           eDP-1 = {
  #             enable = true;
  #             primary = false;
  #             # position = "2560x0";
  #             # mode = "2560x1440";
  #             # rate = "60.00";
  #           };
  #         };
  #       };
  #     };
  # };

  programs.git = {
    enable = true;
    userName  = "V1K1NGbg";
    userEmail = "victor@ilchev.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
