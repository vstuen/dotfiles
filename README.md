### Dotfiles project

#### Packages that should be installed (arch/manjaro)
For all aliases to work, all of the packages should be installed
* zsh (required)
* fzf (required)
* fasd (required)
* i3blocks (required)
* rofi (optional, provides applications menu)
* sysstat (optional, for CPU usage display in i3blocks)
* xorg-xev (optional, for xevkeys alias)
* jq (optional, for `jsonformat` alias, also very handy as a json processor)
* xclip (optional, for `clipcopy` and `clippaste` aliases)

#### Recommended packages
* mons (for multi monitor setup)
* atool (great archiving tool)

#### To install 
##### Using https git repo, read-only
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

##### Using ssh
```bash
git clone --bare git@github.com:vstuen/dotfiles.git $HOME/.cfg.git
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

#### Caps / Escape (No longer in use)
`~/.Xmodmap` swaps Caps Lock with Escape. It should be sourced automatically by lightdm. If not, source it in `.xinitrc`
*Note*: this behavior is commented out, to enable remove the `!` prefixes on each line 

#### Test with docker
Dockerfile:
```dockerfile
FROM dock0/arch:latest

RUN pacman -Syy && \
    pacman -S --noconfirm zsh fzf fasd awk

RUN chsh -s /usr/bin/zsh && \
    sh -c "$(curl -sSL http://tiny.cc/dotfilesinit)"

ENTRYPOINT /usr/bin/zsh

```
