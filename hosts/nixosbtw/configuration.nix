   # Edit this configuration file to define what should be installed on
   # your system.  Help is available in the configuration.nix(5) man page
   # and in the NixOS manual (accessible by running ‘nixos-help’).

   { inputs, outputs, pkgs, ... }:

   {
   imports =
      [ # Include the results of the hardware scan.
         ./hardware-configuration.nix
         inputs.home-manager.nixosModules.home-manager
      ];

   nix.settings.experimental-features = [ "nix-command" "flakes" ];

   # Bootloader.
   boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;

   networking.hostName = "nixosbtw"; # Define your hostname.
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

         xkb = {
         layout = "us";
         variant = "";
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

      pipewire = {
         enable = true;
         alsa.enable = true;
         alsa.support32Bit = true;
         pulse.enable = true;
         jack.enable = true;
      };

      blueman.enable = true;
      gvfs.enable = true;
      udisks2.enable = true;
   };

   # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.victor = {
      isNormalUser = true;
      description = "victor";
      extraGroups = [ "networkmanager" "wheel" ];
   };

   security.rtkit.enable = true;

   # programs.nm-applet.enable = true;

   powerManagement.cpuFreqGovernor = "powersave";

   hardware.bluetooth.enable = true;
   hardware.bluetooth.powerOnBoot = true;

   # Allow unfree packages
   nixpkgs.config.allowUnfree = true;

   # List packages installed in system profile. To search, run:
   # $ nix search wget
   environment.systemPackages = with pkgs; [
      arandr
      bash-completion
      # blueman (not needed?)
      # blueman-applet (not needed?)
      # bluez (can't figure out)
      # bluez-utils (can't figure out)
      brightnessctl
      capitaine-cursors
      neo-cowsay
      # cpupower-gui-git (not needed)
      # cryptsetup (I need to be watched because I am retarded)
      curl
      discord
      docker
      firefox
      fzf
      gimp
      git
      gh
      gnome-terminal
      htop
      jdk8
      jdk17
      jdk22
      keepassxc
      killall
      lolcat
      nano
      nemo
      neofetch
      # networkmanagerapplet
      nodejs
      parsec-bin
      pcloud
      prismlauncher
      ranger
      remmina
      fusuma
      spotify
      tmux
      tree
      unzip
      vim
      vscode-fhs
      # vmware-workstation (maybe)
      wget
      
      zip
   ];

   home-manager = {
      extraSpecialArgs = { inherit inputs outputs; };
      users = {
         victor = import ./home.nix;
      };
   };

   ###### QuestaSim ######

   programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
         xorg.libXtst
         xorg.libXext
         xorg.libX11
         xorg.libXrender
         xorg.libXi
         xorg.libXft
         fontconfig
      ];
   };

   ###### QuestaSim ######

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
