#!/bin/bash

{{ if eq .chezmoi.os "darwin" }}

# Homebrew tap
brew tap moonrepo/proto https://github.com/moonrepo/proto

brew install --cask nikitabobko/tap/aerospace

brew tap manaflow-ai/cmux
brew install --cask cmux

# Claude Code
curl -fsSL https://claude.ai/install.sh | bash

# Homebrew
# See. ./docs/packages.md

PACKAGES=(
  awscli coreutils diffutils ed findutils gawk gnu-sed gnu-tar grep gzip
  parallel tree curl wget zip unzip xz pandoc jq yq lv fd gh ghq gpg git
  git-secrets k6 k9s kubectx kubernetes-cli stern tmux vim fzf skeema zsh
  pnpm ripgrep stripe 1password-cli font-fira-code sheldon wezterm proto navi mise
)

# 未インストールのものだけ抽出して一括インストール
INSTALLED=$(brew list --formula -1 2>/dev/null)
TO_INSTALL=()
for pkg in "${PACKAGES[@]}"; do
  echo "$INSTALLED" | grep -qx "$pkg" || TO_INSTALL+=("$pkg")
done

if [ ${#TO_INSTALL[@]} -gt 0 ]; then
  HOMEBREW_NO_AUTO_UPDATE=1 brew install "${TO_INSTALL[@]}"
fi
{{ end }}

# tmux
mkdir -p ~/.tmux
TPM_DIR=~/.tmux/plugins/tpm; readonly TPM_DIR;
if [ ! -d $TPM_DIR ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
