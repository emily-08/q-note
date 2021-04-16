# テーブル設計

## usersテーブル

| Colmn             | Type        | Options                   |
|:------------------|------------:|:-------------------------:|
| nickname          | string      | null: false               |
| email             | string      | null: false, unique:true  |
| encrypted_password| string      | null: false               |

### Association

- has_many :memos
- has_many :genres

## memosテーブル

| Colmn             | Type        | Options                         |
|:------------------|------------:|:-------------------------------:|
| title             | string      | null: false                     |
| text              | text        |                                 |
| user              | references  | null: false, foreign_key: true  |
| genre             | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :genre

## genresテーブル

| Colmn             | Type        | Options                         |
|:------------------|------------:|:-------------------------------:|
| name              | string      | null: false                     |
| user              | references  | null: false, foreign_key: true  |
| memo              | references  | null: false, foreign_key: true  |

### Association

- has_many :memos
- belongs_to :user


### アプリケーション名

- q-notte

### アプリケーションの概要

- 簡単なメモアプリケーション。ジャンルの作成が可能。それに紐づく、文書であるメモの保存ができる。



### テスト用アカウント

- email: cafe@gmail.com
- password: boss0413

### 利用方法
- 新規登録したユーザーは、ジャンルを作成する。その中のメモ機能に文章を書き込める。そして保存ができ一覧として見ることが可能。

### 目指した課題解決
- メモを見返す際に大量のメモの中から探しやすくする為。勉強専用のメモアプリ。

### 洗い出した要件

- ユーザー管理機能。ユーザーの登録をするのと、個人でメモを管理するためユーザーの管理が必要。ログイン、新規登録、ログアウトが可能。ユーザーは新規登録、もしくはログインしないとアプリを使用出来ない。
- メモ保存機能。メモを保存し記録するためのもの。ユーザーが入力したメモ（文章とタイトル）の保存ができる。ジャンルモデルと紐付いている。選んだジャンル内でメモの保存が可能。バリデーションを設定しておりでタイトルは必ず入力しなければならないこと。
- ジャンル管理機能。メモの内容をジャンルごとに分けると、見やすいのと探しやすいため実装した。ジャンルを作ることができる。ジャンル内にメモを保存できる。ジャンルを作るためnameカラム（ジャンル名）の入力が必須であること。部分テンプレートにより、いつでもジャンルの一覧はブラウザの左側に存在していること。

### 実装した機能についての画像やGIFおよびその説明



### データベース設計
[![Image from Gyazo](https://i.gyazo.com/b7a9196c39cfc41b3372de3cfe95d864.png)](https://gyazo.com/b7a9196c39cfc41b3372de3cfe95d864)