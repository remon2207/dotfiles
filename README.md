# Usage

```
mkdir ~/git ; cd $_
git clone https://github.com/remon2207/dotfiles.git
cd dotfiles
./install.sh
```

### Arch Linux base

If you are on Arch Linux, use the following command

```
./arch_setup.sh
```
and
```
# pacman -S --needed - < pkglist
```
or
# pacman -S --needed - < pkglist-aur
```

### Ubuntu base

If it is Ubuntu, use the following command
Enter the distribution (Ubuntu, Linux-Mint) as the first argument
Otherwise, search for $1 in the string and replace it with your distribution

```
./ubuntu_setup.sh <$1>
```
