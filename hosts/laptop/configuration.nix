# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services = {
    xserver = {
      enable = true;

      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };

      # xrandrHeads = [
      #   {
      #     output = "DP-1";
      #     monitorConfig = ''
      #       Option "PreferredMode" "2560x1440"
      #     '';
      #   }
      #   {
      #     output = "DP-2";
      #     monitorConfig = ''
      #       Option "PreferredMode" "2560x1440"
      #     '';
      #   }
      #   {
      #     output = "DP-3";
      #     monitorConfig = ''
      #       Option "PreferredMode" "2560x1440"
      #     '';
      #   }
      #   {
      #     output = "DP-4";
      #     monitorConfig = ''
      #       Option "PreferredMode" "2560x1440"
      #     '';
      #   }
      #   {
      #     output = "eDP-1";
      #     monitorConfig = ''
      #       Option "PreferredMode" "2560x1440"
      #     '';
      #   }
      #   {
      #     output = "eDP-2";
      #     monitorConfig = ''
      #       Option "PreferredMode" "2560x1440"
      #     '';
      #   }
      # ];

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    udev.extraRules = ''ACTION=="change", SUBSYSTEM=="drm", RUN+="${pkgs.autorandr}/bin/autorandr -c"'';

    autorandr = {
      enable = true;
      profiles = {
          "extend" = {
            fingerprint = {
              "DP1" = "00ffffffffffff003669a83c01010101021e0104b53c2278ff85d5ae4f47a726105054bfcf0081809500b30001010101010101010101565e00a0a0a029503020350055502100001e000000fd0030a5f2f241010a202020202020000000fc004d5349204d414732373251520a000000ff004341384131393030323032373301b102033b714a01020304901112131f3f230917078301000067030c001000383c67d85dc401788000681a0000010330a500e305c000e606050157572b00fa0050a0a01f500a3c350055502100001ef3db0064a0a01e501220080455502100001a249680be703818403f20a80055502100001e0000000000000000000000000000af";
              "eDP1" = "00ffffffffffff0030e4900600000000441e0104a5221378030004000000000000515600000001010101010101010101010101010101bc6100a0a0a05d503020350058c21000001a000000fd0c3cf0717165010a202020202020000000fe00484d483259813135365148470a000000000002813fa8000300000f010a202001f67013790000030114ea860184ff099f002f801f009f055c0002000400810309681a000001013cf0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000af90";
            };
            config = {
              "DP-1" = {
                enable = true;
                primary = true;
                mode = "2560x1440";
                position = "0x0";
              };

              "eDP-1" = {
                enable = true;
                mode = "2560x1440";
                position = "2560x0";
              };
            };
          };
          "duplicate" = {
            fingerprint = {
              "DP-1" = "00ffffffffffff003669a83c01010101021e0104b53c2278ff85d5ae4f47a726105054bfcf0081809500b30001010101010101010101565e00a0a0a029503020350055502100001e000000fd0030a5f2f241010a202020202020000000fc004d5349204d414732373251520a000000ff004341384131393030323032373301b102033b714a01020304901112131f3f230917078301000067030c001000383c67d85dc401788000681a0000010330a500e305c000e606050157572b00fa0050a0a01f500a3c350055502100001ef3db0064a0a01e501220080455502100001a249680be703818403f20a80055502100001e0000000000000000000000000000af";
              "eDP-1" = "00ffffffffffff0030e4900600000000441e0104a5221378030004000000000000515600000001010101010101010101010101010101bc6100a0a0a05d503020350058c21000001a000000fd0c3cf0717165010a202020202020000000fe00484d483259813135365148470a000000000002813fa8000300000f010a202001f67013790000030114ea860184ff099f002f801f009f055c0002000400810309681a000001013cf0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000af90";
            };
            config = {
              "DP-1" = {
                enable = true;
                primary = true;
                mode = "2560x1440";
                position = "0x0";
              };

              "eDP-1" = {
                enable = true;
                mode = "2560x1440";
                position = "0x0";
              };
            };
          };
      };
    };

    libinput = {
      touchpad = {
        naturalScrolling = true;
      };
    };

    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";
    }; 
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.victor = {
    isNormalUser = true;
    description = "victor";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    neofetch
    gnome-terminal
    firefox
    networkmanagerapplet
    vscode-fhs
    jdk
    jdk8
    discord
    git
    cryptsetup
    xorg.xrandr
    autorandr
    arandr
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
