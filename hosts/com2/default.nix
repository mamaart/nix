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
      networks."iPhone".psk = let x = import ../../x.nix; in x.wifiPassword;
    };
  };

  system.stateVersion = "23.11";
}

