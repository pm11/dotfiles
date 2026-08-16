## 導入している package

run_once_01_install-packages.sh.tmpl の `PACKAGES` 配列の内容。

| パッケージ名      | 説明                                | 公式リンク                                                     | 用途                                           |
|------------------|-------------------------------------|----------------------------------------------------------------|------------------------------------------------|
| awscli          | AWSのコマンドラインインターフェース    | [AWS CLI](https://aws.amazon.com/cli/)                         | AWSリソースをターミナルから操作可能               |
| coreutils       | GNU基本コマンドライン・ユーティリティ  | [GNU Coreutils](https://www.gnu.org/software/coreutils/)       | macOSデフォルトのコマンドよりも機能が豊富        |
| diffutils       | ファイル比較ユーティリティ            | [GNU Diffutils](https://www.gnu.org/software/diffutils/)       | より高度なファイル比較が可能                     |
| ed              | 行指向テキストエディタ                | [GNU Ed](https://www.gnu.org/software/ed/)                     | スクリプト処理に適したテキスト編集が可能         |
| findutils       | ファイル検索ユーティリティ            | [GNU Findutils](https://www.gnu.org/software/findutils/)       | より柔軟なファイル検索オプションを提供           |
| gawk            | パターン走査と処理言語                | [GNU Awk](https://www.gnu.org/software/gawk/)                  | テキスト処理の機能が強化される                   |
| gnu-sed         | ストリームエディタ                    | [GNU Sed](https://www.gnu.org/software/sed/)                   | より高度なテキスト加工が可能                     |
| gnu-tar         | アーカイブ作成ユーティリティ          | [GNU Tar](https://www.gnu.org/software/tar/)                   | より多くのアーカイブ形式をサポート               |
| grep            | テキスト検索ユーティリティ            | [GNU Grep](https://www.gnu.org/software/grep/)                 | 高度な検索オプションを提供                       |
| gzip            | 圧縮ユーティリティ                    | [GNU Gzip](https://www.gnu.org/software/gzip/)                 | 効率的なファイル圧縮が可能                       |
| parallel        | 並列処理ユーティリティ                | [GNU Parallel](https://www.gnu.org/software/parallel/)          | 複数のジョブを効率的に並列実行可能               |
| tree            | ディレクトリ構造表示ツール            | [Tree](http://mama.indstate.edu/users/ice/tree/)              | ディレクトリ構造を視覚的に確認可能               |
| curl            | データ転送ツール                      | [curl](https://curl.se/)                                       | HTTPリクエストなどのネットワーク操作が可能       |
| wget            | ネットワークダウンローダー            | [GNU Wget](https://www.gnu.org/software/wget/)                 | 再開可能なダウンロードやミラーリングが可能       |
| zip/unzip       | 圧縮・解凍ユーティリティ              | [Info-ZIP](http://infozip.sourceforge.net/)                    | ZIP形式のファイル操作が可能                      |
| xz              | 高圧縮率の圧縮ツール                  | [XZ Utils](https://tukaani.org/xz/)                           | 高い圧縮率でファイルを圧縮可能                   |
| pandoc          | ドキュメント変換ツール                | [Pandoc](https://pandoc.org/)                                  | 様々な形式のドキュメント変換が可能               |
| jq              | JSONプロセッサ                        | [jq](https://stedolan.github.io/jq/)                           | JSON形式のデータを効率的に処理可能               |
| yq              | YAMLプロセッサ                        | [yq](https://mikefarah.gitbook.io/yq/)                         | YAML形式のデータを効率的に処理可能               |
| lv              | 多機能テキストビューア                | [LV](https://github.com/miyagawa/lv)                           | 日本語対応の高機能テキストビューア               |
| fd              | 高速ファイル検索ツール                | [fd](https://github.com/sharkdp/fd)                            | より直感的で高速なファイル検索が可能             |
| gh              | GitHub CLI                           | [GitHub CLI](https://cli.github.com/)                           | GitHubの操作をCLIから実行可能                   |
| ghq             | リポジトリ管理ツール                  | [ghq](https://github.com/x-motemen/ghq)                        | Gitリポジトリの効率的な管理が可能               |
| gpg             | 暗号化ツール                          | [GnuPG](https://gnupg.org/)                                    | ファイルの暗号化や署名が可能                     |
| git-secrets     | Git用シークレットスキャナー           | [git-secrets](https://github.com/awslabs/git-secrets)          | 機密情報の誤コミットを防止                       |
| k6              | 負荷テストツール                      | [k6](https://k6.io/)                                           | パフォーマンステストの実行が可能                 |
| k9s             | Kubernetes CLI                       | [k9s](https://k9scli.io/)                                      | Kubernetesクラスタの管理が容易に                |
| kubectx         | Kubernetes コンテキスト切替ツール     | [kubectx](https://github.com/ahmetb/kubectx)                   | Kubernetesのコンテキスト切り替えが簡単に         |
| stern           | Kubernetes ログ表示ツール             | [stern](https://github.com/stern/stern)                        | 複数のPodのログを効率的に表示可能               |
| tmux            | ターミナルマルチプレクサ              | [tmux](https://github.com/tmux/tmux)                           | 複数のターミナルセッションを管理可能             |
| vim             | テキストエディタ                      | [Vim](https://www.vim.org/)                                    | 高機能なテキスト編集が可能                       |
| fzf             | ファジーファインダー                  | [fzf](https://github.com/junegunn/fzf)                         | インタラクティブな検索が可能                     |
| skeema          | MySQL スキーマ管理ツール              | [Skeema](https://www.skeema.io/)                               | MySQLスキーマの効率的な管理が可能                |
| ripgrep         | 高速検索ツール                        | [ripgrep](https://github.com/BurntSushi/ripgrep)               | 高速なテキスト検索が可能                         |
| stripe          | Stripe CLI                          | [Stripe CLI](https://stripe.com/docs/stripe-cli)                | Stripe APIのテストや操作が可能                   |
| 1password-cli   | 1Password CLI                       | [1Password CLI](https://1password.com/downloads/command-line/)   | パスワード管理をCLIから操作可能                  |
| font-fira-code  | プログラミングフォント                | [Fira Code](https://github.com/tonsky/FiraCode)                | プログラミングに最適化されたフォントを使用可能    |
| sheldon         | Zshプラグインマネージャー             | [Sheldon](https://github.com/rossmacarthur/sheldon)            | Zshプラグインの効率的な管理が可能                |
| wezterm         | ターミナルエミュレータ                | [WezTerm](https://wezfurlong.org/wezterm/)                     | 高機能で設定可能なターミナル環境を提供           |
| proto           | パッケージマネージャ                  | [proto](https://moonrepo.dev/proto)                            | 言語ランタイムとツールチェーンの管理が可能       |
| navi            | インタラクティブなチートシート         | [navi](https://github.com/denisidoro/navi)                     | コマンドの使い方をインタラクティブに確認可能     |
| mosh            | 遠隔ターミナルアプリケーション         | [Mosh](https://mosh.org/)                                      | 回線断や IP 変更をまたいで SSH 接続を維持可能    |
| tailscale       | WireGuard ベースのメッシュ VPN         | [Tailscale](https://tailscale.com/)                            | 端末間を専用ネットワークで直接接続可能           |
| herdr           | エージェント向けターミナル多重化ツール  | [herdr](https://herdr.dev/)                                    | コーディングエージェントのセッションを常駐管理可能 |
| moshi-hook      | Moshi 連携デーモン                     | [Moshi](https://getmoshi.app/docs/hooks)                       | エージェントの承認要求と状態を iOS アプリへ通知   |
| bun             | JavaScript ランタイム                  | [Bun](https://bun.sh/)                                         | herdr のプラグインを含む JS ツールの実行に必要    |

## cask で導入している package

| パッケージ名   | 説明                              | 公式リンク                                                      | 用途                                             |
|---------------|-----------------------------------|-----------------------------------------------------------------|--------------------------------------------------|
| aerospace     | i3 ライクなタイル型ウィンドウマネージャ | [AeroSpace](https://github.com/nikitabobko/AeroSpace)          | ウィンドウ配置をキーボードで操作可能               |
| cmux          | AI エージェント向けターミナル        | [cmux](https://github.com/manaflow-ai/cmux)                     | 縦タブと通知でエージェントの並行作業を管理可能      |
| tailscale-app | Tailscale の macOS アプリ           | [Tailscale](https://tailscale.com/)                             | メニューバーから接続とログインを操作可能           |

## tap

homebrew-core に無いものは tap を追加して導入する。

- `moonrepo/proto`：proto
- `rjyo/moshi`：moshi-hook
- `nikitabobko/tap`：aerospace
- `manaflow-ai/cmux`：cmux

Homebrew 6 は tap trust を要求する。
信頼していない tap の formula は読み込みを拒否され、`brew install` がそこで中断する。
そのためスクリプトでは `brew trust --formula rjyo/moshi/moshi-hook` を tap 直後に実行している。

## herdr のプラグイン

`rjyo/herdr-window-title-sync` を導入し、フォーカス中のワークスペースとエージェントの状態を端末のウィンドウタイトルに反映させる。

```bash
herdr plugin install rjyo/herdr-window-title-sync --yes
```

`--yes` は stdin が対話的でないときに必要になる。
このプラグインは各イベントで `bun sync-title.js` を起動するため、bun を `PACKAGES` に含めている。

## インストール後に必要な操作

tailscale と moshi-hook は常駐プロセスを伴うため、インストールしただけでは動かない。
使う場合は brew services に登録する。

```bash
sudo brew services start tailscale  # tailscaled は root 権限を要求する
brew services start moshi-hook
```

cask の tailscale-app は GUI から接続を管理し、formula の tailscale は CLI と tailscaled を提供する。
GUI アプリで接続する運用なら tailscaled を常駐させる必要はなく、formula 側は `tailscale` コマンドの利用にとどめる。
tailscale-app の入れ替えは動作中のアプリを終了させ、旧版の削除に sudo も要求する。
そのためスクリプトでは `/Applications/Tailscale.app` と Caskroom の両方を確認し、どちらにも無いときだけ入れる。
アプリの実体を見るのは、cask 管理外で手動インストールされている場合を拾うため。
更新は `brew upgrade --cask tailscale-app` を対話的な端末から実行する。

moshi-hook はペアリングと hook の導入を別途行う。

```bash
moshi-hook pair --token $MOSHI_PAIRING_TOKEN
moshi-hook install
```
