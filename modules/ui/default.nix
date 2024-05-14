{pkgs, ...}:
let
  dwm-status = pkgs.buildGoModule {
    pname = "statusbar";
    version = "0.0.2";
    src = builtins.fetchGit {
      url = "https://github.com/mamaart/dwm-status.git";
      ref = "main";
      rev = "b81337fb3968c6bc00c2413d9b02608837e6ba95";
    };
    vendorHash = "sha256-bZ8BbYgebatTQh4KVv2J0hBLwPuOHZaQAQX3o63R4HU=";
  };
in
{
  services.xserver = {
    enable = true;
    windowManager.dwm = {
      enable = true;

      displayManager.sessionCommands = ''
        ${dwm-status}/bin/statusbar &
      '';

      package = pkgs.dwm.override {
        conf = ./dwm-config.h;
      };
    };
    libinput.enable = true;
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    dmenu
    xclip
    (st.overrride {
      conf = builtins.readFile /st-config.h;
      patches = [ ./st-anysize.diff ];
    })
    dwm-status
  ];
}
