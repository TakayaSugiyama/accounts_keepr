# README

## アプリ名 AccountsKeeper

![Imgur](https://i.imgur.com/rNwt8Pa.png)


![Imgur](https://i.imgur.com/zCI9UlK.png)



![Imgur](https://i.imgur.com/CgNsrWz.png)

## Heroku 
https://young-taiga-20455.herokuapp.com/

## 概要

  日々のお金の流れを把握することができる家計簿アプリ。

## バージョン情報

  Ruby 2.6.3 ,
  Ruby on Rails 5.2.3

## カタログ設計
https://docs.google.com/spreadsheets/d/1RD7jpve8eY3zwVRgTJJyagzFbNL5wXDSX1_3_qztyrc/edit?usp=sharing

## 機能一覧

- ユーザー機能 
  - ユーザー登録
  - ログイン/ログアウト機能 
    - Google, Facebook, Yahoo各SNSでのログイン・ログアウト機能
  -  マイページ(ユーザー情報管理)
  - 退会機能　
-  家計簿管理機能
    - 使用状況ページ 
    - 家計簿登録機能
    - 上限アラートメール
    -  タグ付け、検索 機能
    -  csvダウンロード機能
-  レビュー機能
    - レビュー投稿機能
    - コメント機能
    

## テーブル定義
https://docs.google.com/spreadsheets/d/1gPVrMuYmgLHGt5aiq6qHgiY5BT50O_FA37moAreEzUg/edit?usp=sharing

## ER図 
https://gyazo.com/457bfc6f1c2297ce19ee3763cfd2e657

## 画面遷移図
 https://docs.google.com/spreadsheets/d/1_mOu4XsW04zrnbsH1-6BsKjR6FLK62PHsayS8m_AAuk/edit?usp=sharing
## ワイヤーフレーム
https://docs.google.com/presentation/d/1JWiNAiFC7Wlq2qCXs2NqP9eQcEFjstzxWDWUH9478UM/edit?usp=sharing

## How to Start 
```
  1.  git clone https://github.com/TakayaSugiyama/accounts_keepr.git 
  2.  rails db:create 
  3.  rails db:seed 
  4.  yarn install
  5.  bundle exec rspec    
  6.  rails s  
```

## 使用予定Gem
- devise 
- carrirwave 
- mini magick 
- cocoon 
- ratyrate 
- jquery-rails 
- aws-fog 
- chartkick  
- bootstrap_form 
- ransack 


