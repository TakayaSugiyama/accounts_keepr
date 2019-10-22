require 'rails_helper'

RSpec.describe 'Records', type: :feature do

  describe '新規家計簿登録' do 
    before "ログイン" do 
      user = FactoryBot.create(:user)
      visit new_user_session_path 
      fill_in "メールアドレス",with: "test1@railstest.org"
      fill_in  "パスワード", with: "testtest"
      click_button "ログイン"
    end

    it "登録できる" do 
      visit new_record_path 
      fill_in "購入日", with: Date.today
      fill_in "店の名前",with: "セブンイレブン"
      fill_in "購入金額",with: 1000 
      click_on "メモを削除する"
      click_on "商品情報を削除する"
      click_on "登録する"
      expect(page).to have_content "家計簿詳細"
      expect(Record.all.count).to eq 1
    end
  end

end