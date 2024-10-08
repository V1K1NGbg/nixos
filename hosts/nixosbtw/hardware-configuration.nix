# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
   imports =
      [ (modulesPath + "/installer/scan/not-detected.nix")
      ];

   boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" ];
   boot.initrd.kernelModules = [ ];
   boot.kernelModules = [ "kvm-intel" ];
   boot.extraModulePackages = [ ];

   fileSystems."/" =
      { device = "/dev/disk/by-uuid/a3af41c1-364a-4451-86f3-8468907f86c9";
         fsType = "ext4";
      };

   fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/AB21-E391";
         fsType = "vfat";
         options = [ "fmask=0077" "dmask=0077" ];
      };

   swapDevices =
      [ { device = "/dev/disk/by-uuid/bd22acd9-4bab-42f4-a260-99841f03580c"; }
      ];

   # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
   # (the default) this is the recommended approach. When using systemd-networkd it's
   # still possible to use this option, but it's recommended to use it in conjunction
   # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
   networking.useDHCP = lib.mkDefault true;
   # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

   nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
   hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
