# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:
let nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
export __NV_PRIME_RENDER_OFFLOAD=1
export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __VK_LAYER_NV_optimus=NVIDIA_only
exec -a "$0" "$@"
'';
in {
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.loader = {
      systemd-boot.enable      = true;
      efi.canTouchEfiVariables = true;
  };

  fileSystems = {
      "/" = {
          device = "/dev/disk/by-label/nixos";
          fsType = "ext4";
      };

      "/boot" = {
          device = "/dev/disk/by-label/boot";
          fsType = "vfat";
      };

      "/media/Drive2" = {
          device = "/dev/disk/by-uuid/b614af56-193e-4174-9ec8-3e6e73d886f8";
          fsType = "ext4";
      };
  };
  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];


  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    hardware = {
        opengl.enable = true;
        nvidia.prime = {
            offload.enable = true;
            nvidiaBusId = "PCI:1:0:0";
            intelBusId = "PCI:0:2:0";
        };
        bluetooth.enable = true;
    };
    environment.systemPackages = with pkgs; [
            nvidia-offload 
    ];
}
