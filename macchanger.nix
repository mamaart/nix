{pkgs, ...}:
let 
  change-mac = pkgs.writeShellScript "change-mac" ''
  ${pkgs.iproute2}/bin/ip link set "$1" down
  ${pkgs.macchanger}/bin/macchanger -A "$1"
  ${pkgs.iproute2}/bin/ip link set "$1" up
  '';
in {
  systemd.services.macchanger = {
    enable = true;
    description = "macchanger on wlp3s0";
    wants = [ "network.target"];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${change-mac} wlp3s0";
    };
  };
}
