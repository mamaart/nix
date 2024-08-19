{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.2/24" ];
      listenPort = 51820;
      privateKeyFile = "/home/martin/wireguard-keys/private";
      peers = [
        {
          publicKey = "/home/martin/server-wg-keys/public";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "slacklife.dk:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
