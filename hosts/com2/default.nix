let
  passwords = import ../../x.nix;
in
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
        "Månss Wi-Fi-netværk".pskRaw = passwords.wifi.maans;
        "cloud".pskRaw = passwords.wifi.cloud;
        "moon_5g".pskRaw = passwords.wifi.moon_5g;
        "moon".pskRaw = passwords.wifi.moon;

        "KK-Public" = {};
        "Publikum" = {};
        "-Guest-UrbanRanger" = {};
      };
    };
  };

  system.stateVersion = "24.05";
}

