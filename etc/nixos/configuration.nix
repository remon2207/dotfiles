{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
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

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  networking = {
    hostName = "nixos";
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };

  systemd = {
    network = {
      enable = true;
      wait-online = {
        enable = false;
      };
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
      nerdfonts
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif CJK JP" ];
        sansSerif = [ "Noto Sans CJK JP" ];
        monospace = [ "Hack Nerd Font" "Noto Sans CJK JP" ];
      };
    };
  };

  programs = {
    git = {
      enable = true;
      userName = "remon2207";
      userEmail = "remon2207.develop@gmail.com";
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
    starship = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
    fish = {
      enable = true;
    };
  };

  users = {
    users = {
      remon = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.zsh;
        packages = with pkgs; [
          xorg.xorgserver
          xorg.xf86inputevdev
          xorg.xf86inputsynaptics
          xorg.xf86inputlibinput
          xorg.xf86videonouveau
          git
          neovim
          starship
          zsh
          fish
          wget
          curl
          firefox
          vivaldi
          google-chrome
          kitty
          alacritty
          wezterm
          tmux
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