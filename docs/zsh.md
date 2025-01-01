## Zsh 設定ファイルの読み込み順について

- `~/.zshenv`
- `/etc/zprofile` (login shell)
  - ただし、 `path_helper` の問題があり、 `.zshenv` で同様の内容を実行することで優先順位を下げている
- `~/.zprofile` (login shell)
- `/etc/zshrc` (interactive shell)
- `~/.zshrc` (interactive shell)
- `/etc/.zlogin` (login shell)
