# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Review', type: :feature do

  describe 'レビューのCRUD' do
    before do
      label_names = %w[未分類 食費 日用品費 レジャー費 交際費 医療費 養育費 美容費 被服費 趣味・娯楽費 交通費 家賃 水道・光熱費 保険 税・社会保証 自動車関連費 その他]
      label_names.each do |name|
        FactoryBot.create(:label, name: name)
      end
      @user = FactoryBot.create(:user)
      @record = FactoryBot.create(:record, user_id: @user.id)
      @product = FactoryBot.create(:product, record_id: @record.id)
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'
    end

    it 'レビューを作成できる' do
      visit record_path(@record)
      click_on 'レビューを書く'
      fill_in  'タイトル', with: 'test tiele'
      fill_in  'レビュー', with: 'test reveiw content'
      find('#review_rating', visible: false).set(3)
      click_on '登録する'
      expect(Review.all.count).to eq 1
    end

    it 'レビューを削除できる' do
      review = FactoryBot.create(:review, user_id: @user.id, product_id: @product.id)
      expect(Review.all.count).to eq 1
      visit review_path(review)
      click_on '削除'
      expect(Review.all.count).to eq 0
    end

    it 'レビューを更新できる' do
      review = FactoryBot.create(:review, user_id: @user.id, product_id: @product.id)
      visit review_path(review)
      click_on '編集'
      fill_in 'タイトル', with: 'updated'
      fill_in 'レビュー', with: 'updated'
      find('#review_rating', visible: false).set(5)
      click_on '更新する'
      expect(page).to have_content 'レビューを更新しました'
    end
  end
end
