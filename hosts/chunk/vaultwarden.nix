{...}: {
  services.vaultwarden = {
    enable = true;
    dbBackend = "postgresql";
    environmentFile = "/run/secrets/vaultwarden";
    config = {
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = "8081";
      DATA_FOLDER = "/vw-data";
      DATABASE_URL = "postgresql://vaultwarden:vaultwarden@127.0.0.1:5432/vaultwarden";
    };
  };
}
