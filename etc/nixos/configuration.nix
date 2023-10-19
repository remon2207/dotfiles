{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      modesetting = {
        enable = true;
      };
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  networking = {
    hostName = "nixos";
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };

  systemd = {
    network = {
      enable = true;
      networks."enp6s0" = {
        matchConfig = {
          Name = "enp6s0";
        };
        networkConfig = {
          DHCP = "yes";
        };
      };
    };
  };

  services = {
    resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
    };
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
      };
      displayManager = {
        startx = {
          enable = true;
        };
      };
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
    };
  };

  time = {
    timeZone = "Asia/Tokyo";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-mozc
          fcitx5-gtk
        ];
      };
    };
  };

  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-extra
      noto-fonts-emoji
      hack-font
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif CJK JP" ];
        sansSerif = [ "Noto Sans CJK JP" ];
        monospace = [ "Hack" "Noto Sans CJK JP" ];
      };
    };
  };

  users = {
    users = {
      remon = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        packages = with pkgs; [
          xorg.xorgserver
          xorg.xf86inputevdev
          xorg.xf86inputsynaptics
          xorg.xf86inputlibinput
          xorg.xf86videonouveau
          wget
          curl
          firefox
          neovim
          zsh
          vivaldi
          google-chrome
          kitty
          alacritty
          wezterm
          tmux
          git
          gh
          ghq
          rofi
          polybar
          i3lock
          bat
          docker
          feh
          lsd
        ];
      };
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  system.stateVersion = "23.05";
}
