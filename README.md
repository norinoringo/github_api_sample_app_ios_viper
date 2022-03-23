# GitHub検索アプリ 

### 説明
GitHubのユーザーを閲覧できるクライアントアプリ

### 仕様
- ユーザー一覧画面
  - ユーザー一覧をリストで表示する
  - 各行を選択することでユーザーリポジトリ画面に遷移する
- ユーザーリポジトリ画面
  - リスト上部にユーザーの詳細情報を表示する
    - リスト上部にユーザーの詳細情報を表示する
    - アイコン画像
    - ユーザー名
    - フルネーム
    - フォロワー数
    - フォロイー数 
  - それ以下はforkedリポジトリではないユーザーのリポジトリを一覧表示する
    - リポジトリ名
    - 開発言語
    - スター数
    - 説明文
  - リポジトリ一覧の行をタップするとWebViewでリポジトリのURLを表示する

### 条件
- APIは、 https://developer.github.com/v3/ を利用
- Rate Limitは認証なしの場合、60 requests per hour なのでpersonal access tokenを利用
https://developer.github.com/v3/guides/getting-started/#oauth

### 開発環境
- Xcode Version 13.3 (13E113)
- Swift 5.6
- iOS 15.0
- macOS 12.3
