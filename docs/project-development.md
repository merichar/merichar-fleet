# Per-project Nix development environments

Each project should own its development environment. It may use the same
nixpkgs release as the fleet, but it must not depend on this repository. A
project's `flake.lock` pins its tools and libraries independently of every
machine and every other project.

## Example Python project

Add a `flake.nix` to the project repository:

```nix
{
  description = "Development environment for example-project";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      python = pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
        pytest
        requests
      ]);
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ python ];
      };
    };
}
```

Add an `.envrc` alongside it:

```bash
use flake
```

Ignore Direnv's local cache in the project's `.gitignore`:

```gitignore
.direnv/
```

Track the inputs before evaluating a flake from a Git worktree, generate its
lock file, and approve the reviewed `.envrc`:

```console
git add flake.nix .envrc .gitignore
nix flake lock
git add flake.lock
direnv allow
```

Direnv now enters the development shell whenever a shell changes into the
project directory and restores the previous environment when it leaves. The
NixOS Direnv module enables `nix-direnv`, which caches the evaluated environment
so returning to a project usually does not require another full evaluation.

An `.envrc` is executable shell code. Direnv blocks a new or changed file until
`direnv allow` is run again; review the change before approving it.

Without Direnv, the same environment remains available explicitly:

```console
nix develop
```

Different projects can pin different nixpkgs revisions and use incompatible
tool versions simultaneously. Their store paths coexist without changing the
system-wide package configuration.

## What belongs in Git

Commit these files to the project repository:

- `flake.nix`, which declares the development environment
- `flake.lock`, which pins its exact inputs
- `.envrc`, which requests the flake environment
- `.gitignore`, including the `.direnv/` entry

Do not commit `.direnv/`, Nix build results, or Direnv's local approval state.
Do not put tokens, passwords, or other secrets in `.envrc`; it is public project
configuration and executable shell code.
