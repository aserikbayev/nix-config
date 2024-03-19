{
  ## I already had a high value (65535, unlimited) on my working machine, might uncomment if I see lower values on next installations
  ## what are this values? read: https://wilsonmar.github.io/maximum-limits/
  # environment.launchDaemons."limit.maxfiles.plist" = {
  #   enable = true;
  #   text = ''
  #     <?xml version="1.0" encoding="UTF-8"?>
  #     <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  #     "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  #     <plist version="1.0">
  #     <dict>
  #     <key>Label</key>
  #     <string>limit.maxfiles</string>
  #     <key>ProgramArguments</key>
  #     <array>
  #     <string>launchctl</string>
  #     <string>limit</string>
  #     <string>maxfiles</string>
  #     <string>524288</string>
  #     <string>524288</string>
  #     </array>
  #     <key>RunAtLoad</key>
  #     <true/>
  #     <key>ServiceIPC</key>
  #     <false/>
  #     </dict>
  #     </plist>
  #     '';
  # };

  system = {
    defaults = {
      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
      finder = {
        FXDefaultSearchScope = "SCcf";
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        ShowStatusBar = true;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.2;
        expose-animation-duration = 0.2;
        tilesize = 50;
        show-recents = false;
        show-process-indicators = true;
        orientation = "right";
        mru-spaces = false;
        # Quick Note on the bottom right hot corner
        wvous-br-corner = 14;
        # mouse in top right corner will (5) start screensaver
        wvous-tr-corner = 5;
      };
      NSGlobalDomain = {
        "com.apple.sound.beep.volume" = 0.000;
        InitialKeyRepeat = 13;
        KeyRepeat = 2;
      };
      loginwindow.LoginwindowText = "t.me/seazrq";
      screencapture.location = "~/Pictures/screenshots";
    };

    # Add ability to use TouchID for sudo authentication
    security.pam.enableSudoTouchIdAuth = true;

    # https://medium.com/@zmre/nix-darwin-quick-tip-activate-your-preferences-f69942a93236
    activationScripts.postUserActivation.text = ''
      # Following line should allow us to avoid a logout/login cycle
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      launchctl stop com.apple.Dock.agent
      launchctl start com.apple.Dock.agent
      '';
  };
}