{ pkgs, ...}:
{

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  fonts.packages = with pkgs; [ 
    (nerdfonts.override { fonts = [ "Go-Mono" "Lilex" "Meslo" ]; })
  ];

  time.timeZone = "Europe/Copenhagen";

  virtualisation.docker.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.options = "caps:escape";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; 
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };

  programs.zsh.enable = true;
  programs.adb.enable = true;

  services.tor.enable = true;

  services.blueman.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.martin = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [ "wheel" "martin" "adbusers" "docker" "kvm" ];
      # Generate hashed password with mkpasswd
      hashedPassword = let x = import ../../x.nix; in x.hashedUserPassword;
    };
  };

  environment = {
    persistence."/persistent" = {
      users.martin = {
        directories = [
          "Documents"
          { directory = ".ssh"; mode = "0700"; }
          "go"
          ".android"
          "Android"
          { directory = ".kube"; mode = "0700"; }
	];
      };
    };
    shells = with pkgs; [
      zsh
    ];
    systemPackages = with pkgs; [
      zellij
      lazygit
      brightnessctl
      rsync
      tmux
      links2
      vim
      git
      btop
      ripgrep
      jq
      yq-go
      fzf
      exiftool
      bat
      ranger
      unzip
      macchanger
      gh
      mplayer
      ffmpeg-full
      yt-dlp
      mkpasswd
      gcc
      transmission_4-qt
      tor-browser
      inkscape
      sxiv
      kubectl
      cmctl
      kubernetes-helm
      argocd
      drone-cli

      cargo

      # Android development

      android-studio

      # Multimedia
      mpv
      evince

      go
      golines
      gofumpt
      golangci-lint
      gotools # goimports, gorename, callgraph, guru
      gomodifytags
      gotests
      iferr
      reftools # fillstruct, fillswitch
      delve # dlv
      ginkgo
      richgo
      gotestsum
      mockgen
      govulncheck

      nmap

      protoc-gen-go
      protoc-gen-go-grpc
      protobuf

      plantuml
      iamb

      sqlite
      sqlitebrowser
      tigervnc
      (python3.withPackages (python-pkgs: [
        python-pkgs.requests
      ]))

      mitmproxy
    ];

    variables = {
      EDITOR = "nvim";
      GOLANG_PROTOBUF_REGISTRATION_CONFLICT = "ignore";
      CGO_ENABLED="1";
    };
  };

}
