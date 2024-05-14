{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "com";
    wireless = {
      enable = true;
      networks."iPhone".pskRaw = let x = import ../../x.nix; in x.hashedWifiPassword;
    };
  };

  system.stateVersion = "23.11";
}

