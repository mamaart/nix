{pkgs, ...}:
let
  dwm-status = pkgs.buildGoModule {
    pname = "statusbar";
    version = "0.0.3";
    src = builtins.fetchGit {
      url = "https://github.com/mamaart/dwm-status.git";
      ref = "main";
      rev = "3307e0e725405ce087584c85332f6b1ece993c71";
    };
    vendorHash = "sha256-Q0nrU39JrWfcQCsBONB6JE3K8pqzoJRxL81rgVpvhQQ=";
  };
in
{
  services.xserver = {
    enable = true;

    displayManager.sessionCommands = ''
      ${dwm-status}/bin/statusbar &
    '';

    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.override {
        conf = ./dwm-config.h;
      };
    };

  };

  services.libinput.enable = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    dmenu
    xclip
    (st.override {
      conf = builtins.readFile ./st-config.h;
      patches = [ ./st-anysize.diff ];
    })
    dwm-status
  ];
}
