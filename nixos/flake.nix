{
  description = "NixOS configuration for the merichar fleet";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Update this pin deliberately; Doom changes independently of NixOS.
    doom-emacs = {
      url = "github:doomemacs/doomemacs/3e15fb36d7f94f0a218bda977be4d3f5da983a71";
      flake = false;
    };

  };

  outputs = { doom-emacs, home-manager, nixpkgs, ... }: {
    nixosConfigurations.rizzorat = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/rizzorat/configuration.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.config.allowUnfreePredicate = pkg:
            builtins.elem (nixpkgs.lib.getName pkg) [
              "claude-code"
            ];

          # Preserve pre-existing dotfiles the first time Home Manager takes
          # ownership of them so the migration remains reversible.
          home-manager.backupFileExtension = "pre-home-manager";
          home-manager.extraSpecialArgs = { inherit doom-emacs; };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.merichar = import ./home/merichar/workstation.nix;
        }
      ];
    };
  };
}
