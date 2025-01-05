#!/bin/bash

{{ if eq .chezmoi.os "darwin" }}

# Homebrew tap
brew tap moonrepo/proto https://github.com/moonrepo/proto

# Homebrew
# See. ./docs/packages.md

read -r -d '' PACKAGES <<EOF
asdf
awscli
coreutils
diffutils
ed
findutils
gawk
gnu-sed
gnu-tar
grep
gzip
parallel
tree
curl
wget
zip
unzip
xz
pandoc
jq
yq
lv
fd
gh
ghq
gpg
git
git-secrets
k6
k9s
kubectx
kubernetes-cli
stern
tmux
vim
fzf
skeema
zsh
pnpm
ripgrep
stripe
ripgrep
1password-cli
font-fira-code
sheldon
wezterm
proto
navi
EOF

for package in `echo $PACKAGES`; do
  HOMEBREW_NO_AUTO_UPDATE=1 brew install $package
done
{{ end }}

# tmux
mkdir -p ~/.tmux
TPM_DIR=~/.tmux/plugins/tpm; readonly TPM_DIR;
if [ ! -d $TPM_DIR ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
