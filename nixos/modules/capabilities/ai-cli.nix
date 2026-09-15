{ pkgs, ... }:

{
  # Terminal AI clients for development and administration.
  environment.systemPackages = with pkgs; [
    claude-code
    codex
  ];
}
