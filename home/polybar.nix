{ ... }:

{
  services.polybar = {
    enable = true;
    script = ''
      polybar foobar &
    '';
    settings = {
      "bar/foobar" = {
        modules-right = "date";
      };
      "module/date" = {
        type = "internal/date";
        interval = "1.0";
        date = "%Y-%m-%d%";
        time = "%H:%M";
        label = "%date% %time%";
      };
    };
  };
}

