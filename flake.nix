{
  inputs = {
    dream2nix.url = "github:nix-community/dream2nix";
  };

  outputs = {
    self,
    dream2nix,
  } @ inp:
    (dream2nix.lib.makeFlakeOutputs {
      systems = ["x86_64-linux"];
      config.projectRoot = ./.;
      source = ./.;
      settings = [
        {
          subsystemInfo.noDev = true;
          subsystemInfo.nodejs = 18;
        }
      ];
    })
    // {
      checks = self.packages;
    };
}
