{ config, pkgs, ... }:

{
  services.swaync = {
    enable = true;

    style = ''
      * {
        font-family: "Inter";
      }

      .notification {
        background: rgba(0, 0, 0, 0.9);
        border: 0.5px solid rgba(255, 255, 255, 0.5);
        border-radius: 15px;
      }

      .notification-content {
        padding: 10px;
      }

      .image {
        margin-right: 15px;
      }

      .body {
        margin-left: 10px;
        font-size: 16px;
        font-weight: 400;
        color: white;
      }

      .summary {
        margin-left: 10px;
        font-size: 16px;
        font-weight: 600;
        color: white;
      }

      .control-center {
        margin: 5px 5px 5px 0;
        background: rgba(0, 0, 0, 0.9);
        border: 0.5px solid rgba(255, 255, 255, 0.5);
        border-radius: 10px;
      }

      .widget-title {
        color: white;
        padding: 10px 10px 0 10px;
        font-weight: 800;
        font-size: 30px;
      }

      .widget-title > button {
        font-size: 14px;
        color: white;
        border-radius: 10px;
        border: 0.5px solid white;
      }

      .widget-dnd {
        font-size: 18px;
        font-weight: 800;
        padding: 0 10px 10px 10px;
        color: white;
      }

      .widget-dnd > switch {
        border-radius: 10px;
        border: 0.5px solid white;
      }

      .widget-dnd > switch:checked {
        background: white;
      }

      .widget-dnd > switch slider,
      .widget-dnd > switch:checked slider {
        background: white;
        border: 2px solid black;
        border-radius: 10px;
      }

      .time {
        font-size: 14px;
        font-weight: 600;
        color: white;
        margin-right: 0;
      }

      .close-button {
        margin-top: -100px;
        color: transparent;
        background: transparent;
      }

      .notification-group-icon {
        color: white;
        margin-right: 5px;
      }

      .notification-group-header {
        color: white;
      }

      .notification-group-collapse-button,
      .notification-group-close-all-button {
        color: black;
        background: white;
        border-radius: 10px;
      }

      .notification-group-collapse-button {
        margin-right: 10px;
      }

      .control-center-list-placeholder {
        color: white;
        font-weight: 800;
      }
    '';
  };
}
