# GitHub検索アプリ 

## 説明
GitHubのリポジトリやユーザーを閲覧できるクライアントアプリ

## 仕様

### TOP画面
- GitHub REST APIを利用したリポジトリ検索画面への遷移する
- GitHub API v3を利用したユーザー一覧検索画面への遷移する

### キーワード入力画面
  - ユーザーが任意のクエリ文字列を入力できる

### リポジトリ一覧画面
- ユーザーが任意のクエリ文字列を渡してリポジトリの検索結果を表示する
- リポジトリ一覧の行をタップするとWebViewでリポジトリのURLを表示する

### アクセストークン入力画面
- アクセストークンを入力して、ユーザー一覧画面へ遷移する

### ユーザー一覧画面
- ユーザー一覧をリストで表示する
- 各行を選択することでユーザーリポジトリ画面に遷移する

### ユーザーリポジトリ画面
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

## 条件
### GitHubのユーザーを閲覧できるクライアントアプリ
- APIは、 https://developer.github.com/v3/ を利用
- Rate Limitは認証なしの場合、60 requests per hour なのでpersonal access tokenを利用
https://developer.github.com/v3/guides/getting-started/#oauth

### GitHub REST APIを利用したリポジトリ検索結果画面
1. APIパラメータとなるクエリ文字列を受け取れること
2. 受け取ったクエリ文字列を画面に表示できること
3. GitHub REST APIのSearch APIを利用し、リポジトリの検索結果をリストで画面に表示できること


## 開発環境
- Xcode Version 13.3 (13E113)
- Swift 5.6
- iOS 15.0
- macOS 12.3

## 画面構成

### TOP画面
<img src="https://user-images.githubusercontent.com/48813229/164947969-d9d593a0-cb1f-454e-a596-156cdd73dbac.png" width="320">

### キーワード入力画面
<img src="https://user-images.githubusercontent.com/48813229/164947985-b738ce72-752b-4a1f-9d7a-dd8b3ec85543.png" width="320">

### リポジトリ一覧画面
<img src="https://user-images.githubusercontent.com/48813229/164948018-dc07bc54-e98c-487c-b61e-b792a69fa6c8.png" width="320">

### アクセストークン入力画面
<img src="https://user-images.githubusercontent.com/48813229/159809511-f5f32172-ad70-46d1-8a16-98fc32f39db6.png" width="320">

### ユーザー一覧画面
<img src="https://user-images.githubusercontent.com/48813229/159809512-4ef3aba2-7d24-4038-8edf-0ce21c0a6ae7.png" width="320">

### ユーザーリポジトリ画面
<img src="https://user-images.githubusercontent.com/48813229/159809991-c29c25c1-faeb-4d4c-a3dd-4cff5b54fcb1.png" width="320">
