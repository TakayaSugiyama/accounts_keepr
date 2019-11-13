# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Records', type: :feature do
  describe '新規家計簿登録' do
    before 'ログイン' do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'
    end

    before '費目作成' do
      label_names = %w[未分類 食費 日用品費 レジャー費 交際費 医療費 養育費 美容費 被服費 趣味・娯楽費 交通費 家賃 水道・光熱費 保険 税・社会保証 自動車関連費 その他]
      label_names.each do |name|
        FactoryBot.create(:label, name: name)
      end
    end

    it '登録できる(簡単入力)' do
      visit new_record_path
      fill_in '購入日', with: Date.today
      fill_in '店の名前', with: 'セブンイレブン'
      fill_in '購入金額', with: 1000
      select '食費', from: '分類'
      click_on 'メモを削除する'
      click_on '商品情報を削除する'
      click_on '登録する'
      expect(page).to have_content '家計簿詳細'
      expect(Record.all.count).to eq 1
    end

    it '登録できる(メモと商品を同時に)' do
      visit new_record_path
      # 入力
      fill_in '購入日', with: Date.today
      fill_in '店の名前', with: 'セブンイレブン'
      select '未分類', from: '分類'
      fill_in '購入金額', with: 1000
      # メモを記入する
      fill_in '内容', with: 'Textが入ります。Textが入ります'
      # 製品の項目を入力する
      fill_in '商品名', with: '商品Test'
      fill_in '値段', with: 1000
      click_on '登録する'
      expect(page).to have_content '家計簿詳細'
      expect(page).to have_content '家計簿を作成しました'
      expect(Record.all.count).to eq 1
    end

    it '更新できる' do
      # 商品、メモ、製品情報を作成する
      record = FactoryBot.create(:record)
      memo = FactoryBot.create(:memo, record_id: record.id)
      product = FactoryBot.create(:product, record_id: record.id)
      visit edit_record_path(record)
      # 更新する
      fill_in '購入日', with: Date.today << 1
      fill_in '値段', with: 3000
      select '税・社会保証', from: '分類'
      fill_in '内容', with: 'this text is updated'
      fill_in '値段', with: 3000
      fill_in '商品名', with: 'this product name is updated'
      click_on '更新する'
      expect(page).to have_content '家計簿詳細'
      expect(page).to have_content '家計簿を更新しました'
      expect(Record.all.count).to eq 1
    end

    it '家計簿を削除する' do
      record = FactoryBot.create(:record, user_id: @user.id)
      visit record_path(record)
      click_on '削除'
      expect(page).to have_content '家計簿を削除しました'
      expect(Record.all.count).to eq 0
    end
  end
end
