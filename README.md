### Dotfiles project

#### Packages that should be installed (arch/manjaro)
For all aliases to work, all of the packages should be installed
* i3blocks (required)
* sysstat (optional, for CPU usage display in i3blocks)
* xorg-xev (optional, for xevkeys alias)

#### To install
```bash
git clone --bare https://github.com/vstuen/dotfiles $HOME/.cfg.git
function config {
   /usr/bin/git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config --local status.showUntrackedFiles no
```

#### Caps / Escape
`~/.Xmodmap` swaps Caps Lock with Escape. It should be sourced automatically by lightdm. If not, source it in `.xinitrc`
