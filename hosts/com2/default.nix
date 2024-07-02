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
      networks = {
        "iPhone".pskRaw = let x = import ../../x.nix; in x.hashedWifiPassword;
        "KK-Public" = {};
        "-Guest-UrbanRanger" = {};
        "MOON".pskRaw = let x = import ../../x.nix; in x.hashedMoonPassword;
        "TP-Link_35F4".psk = "65731123";
      };
    };
  };

  system.stateVersion = "24.05";
}

