{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "clock" ];
        modules-right = [ "battery" "network" "bluetooth" "pulseaudio" ];

        clock = {
          format = "{:%m/%d %H:%M}";
          tooltip-format = "{:%A, %B %d, %Y %H:%M:%S}";
        };

        battery = {
          format = "{capacity}% {icon}";
          format-icons = [ "▏" "▎" "▍" "▌" "▋" "▊" "▉" "█" ];
          format-charging = "{capacity}% ⚡";
        };

        network = {
          format-wifi = "{essid} ";
          format-ethernet = "{ifname} 󰈀";
          format-disconnected = "offline";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
          on-click = "nm-connection-editor";
        };

        bluetooth = {
          format = "{status} ";
          format-disabled = "off ";
          format-connected = "{num_connections} ";
          on-click = "blueman-manager";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "muted ";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "Terminus (TTF)";
        font-size: 16px;
      }

      window#waybar {
        background: #0d1117;
        color: #c9d1d9;
      }

      #clock, #battery, #network, #bluetooth, #pulseaudio {
        padding: 0 10px;
      }
    '';
  };
}
