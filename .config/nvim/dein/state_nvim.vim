if g:dein#_cache_version !=# 220 || g:dein#_init_runtimepath !=# '/home/remon/.config/nvim/dein/repos/github.com/Shougo/dein.vim,/home/remon/.config/nvim,/etc/xdg/xdg-cinnamon/nvim,/etc/xdg/nvim,/home/remon/.local/share/nvim/site,/usr/share/gnome/nvim/site,/usr/share/cinnamon/nvim/site,/home/remon/.local/share/flatpak/exports/share/nvim/site,/var/lib/flatpak/exports/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/tmp/.mount_nvim.a4gUIT9/usr/share/nvim/runtime,/tmp/.mount_nvim.a4gUIT9/usr/lib/nvim,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/var/lib/flatpak/exports/share/nvim/site/after,/home/remon/.local/share/flatpak/exports/share/nvim/site/after,/usr/share/cinnamon/nvim/site/after,/usr/share/gnome/nvim/site/after,/home/remon/.local/share/nvim/site/after,/etc/xdg/nvim/after,/etc/xdg/xdg-cinnamon/nvim/after,/home/remon/.config/nvim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/remon/dotfiles/.config/nvim/init.vim', '/home/remon/.config/nvim/dein.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/remon/.config/nvim/dein'
let g:dein#_runtime_path = '/home/remon/.config/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/remon/.config/nvim/dein/.cache/init.vim'
let &runtimepath = '/home/remon/.config/nvim/dein/repos/github.com/Shougo/dein.vim,/home/remon/.config/nvim,/etc/xdg/xdg-cinnamon/nvim,/etc/xdg/nvim,/home/remon/.local/share/nvim/site,/usr/share/gnome/nvim/site,/usr/share/cinnamon/nvim/site,/home/remon/.local/share/flatpak/exports/share/nvim/site,/var/lib/flatpak/exports/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/home/remon/.config/nvim/dein/.cache/init.vim/.dein,/tmp/.mount_nvim.a4gUIT9/usr/share/nvim/runtime,/home/remon/.config/nvim/dein/.cache/init.vim/.dein/after,/tmp/.mount_nvim.a4gUIT9/usr/lib/nvim,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/var/lib/flatpak/exports/share/nvim/site/after,/home/remon/.local/share/flatpak/exports/share/nvim/site/after,/usr/share/cinnamon/nvim/site/after,/usr/share/gnome/nvim/site/after,/home/remon/.local/share/nvim/site/after,/etc/xdg/nvim/after,/etc/xdg/xdg-cinnamon/nvim/after,/home/remon/.config/nvim/after'
filetype off
  set background=dark
  autocmd Colorscheme * highlight Normal ctermbg=none
  autocmd Colorscheme * highlight NonText ctermbg=none
  autocmd Colorscheme * highlight Folded ctermbg=none
  autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
  " colorscheme 設定は source 後に行う必要があるので VimEnter で行う。
  " 但し Colorscheme イベントの発生が抑制されないよう nented を付ける。
  au MyAutoCmd VimEnter * nested colorscheme iceberg
  let g:deoplete#enable_at_startup = 1
