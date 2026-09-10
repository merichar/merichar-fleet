{
  description = "NixOS configuration for the merichar fleet";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = { nixpkgs, ... }: {
    nixosConfigurations.rizzorat = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/rizzorat/configuration.nix ];
    };
  };
}
