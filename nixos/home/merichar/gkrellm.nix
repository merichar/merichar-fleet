{ pkgs, ... }:

let
  gkrellmBfm = pkgs.callPackage ../../packages/gkrellm-bfm { };
in
{
  home.file = {
    ".gkrellm2/data/startup_position".source = ./gkrellm/data/startup_position;
    ".gkrellm2/plugin_enable".source = ./gkrellm/plugin_enable;
    ".gkrellm2/plugins/gkrellm-bfm.so".source = "${gkrellmBfm}/lib/gkrellm2/plugins/gkrellm-bfm.so";
    ".gkrellm2/sensor-config".source = ./gkrellm/sensor-config;
    ".gkrellm2/theme_config".source = ./gkrellm/theme_config;
    ".gkrellm2/themes/invisible-jkx".source = ./gkrellm/themes/invisible-jkx;
  };
}
