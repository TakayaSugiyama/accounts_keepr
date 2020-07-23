# README

## 環境構築

```
  $ git clone https://github.com/TakayaSugiyama/accounts_keepr.git
  $ cd ~/accounts_keeper
  $ docker-compose up - d
  $ docker-compose run web rails db:create db:migrate
  $ docker-compose run yarn install
  $ docker-compose run web bundle exec rubocop
  $ docker-compose run web bundle exec rspec
```

`docker-compose up`をするとコンテナが起動します。

以下の URL にアクセスしてください。

http://localhost:3001

### tips

- web コンテナに入るとき

```
$ docker-compose exec web /bin/bash
```

- コンテナを止めたいとき

```
$ docker-compose stop
```

## アプリ名 AccountsKeeper

![Imgur](https://i.imgur.com/rNwt8Pa.png)

![Imgur](https://i.imgur.com/zCI9UlK.png)

![Imgur](https://i.imgur.com/CgNsrWz.png)

## Heroku

https://young-taiga-20455.herokuapp.com/

![Imgur](https://i.imgur.com/jFbwwhD.png)

## 概要

日々のお金の流れを把握することができる家計簿アプリ。

## バージョン情報

Ruby 2.6.3 ,
Ruby on Rails 5.2.3


## 機能一覧

- ユーザー機能
  - ユーザー登録
  - ログイン/ログアウト機能
    - Google でのログイン・ログアウト機能
  - マイページ(ユーザー情報管理)
  - 退会機能
- 家計簿管理機能
  - 使用状況ページ
  - 家計簿登録機能
  - 上限アラートメール
  - タグ付け、検索 機能
  - csv ダウンロード機能
- レビュー機能
  - レビュー投稿機能
  - コメント機能

## ER 図

https://gyazo.com/457bfc6f1c2297ce19ee3763cfd2e657

