# merichar-fleet

Public, reproducible configuration for the independently managed merichar fleet.

Configuration is grouped by operating system:

- `nixos/` contains the NixOS flake, host configurations, and modules shared only within this fleet.
- `windows/` is reserved for lightweight, Git-managed Windows provisioning.

Secrets do not belong in this repository. Encrypted secrets intended for declarative distribution will live in a separate private `merichar-fleet-secrets` repository; machine-local secrets remain on their machines.

## NixOS

Each machine has an explicit configuration under `nixos/hosts/<hostname>/`. From the `nixos/` directory, evaluate and activate a host with:

```console
git add flake.nix hosts/rizzorat/configuration.nix hosts/rizzorat/hardware-configuration.nix
nix --extra-experimental-features "nix-command flakes" flake lock
git add flake.lock
sudo nixos-rebuild --extra-experimental-features "nix-command flakes" test --flake ".#rizzorat"
sudo nixos-rebuild switch --flake ".#rizzorat"
```

Run `switch` only after `test` succeeds. The initial `rizzorat` configuration intentionally preserves the known-working installed configuration; shared modules should be extracted afterward.
