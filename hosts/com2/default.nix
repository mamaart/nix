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
      #userControlled.enable = true;
      networks = {
        "Ssid".pskRaw = let x = import ../../x.nix; in x.hashedWifiPassword;
        "KK-Public" = {};
        "Publikum" = {};
        "-Guest-UrbanRanger" = {};
        "moon_5g".psk = "53312020";
        "TP-Link_35F4".psk = "65731123";
      };
    };
  };

  system.stateVersion = "24.05";
}

