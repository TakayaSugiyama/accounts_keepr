require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe "新規登録機能"  do 
    before  do 
      visit new_user_registration_path
      fill_in "メールアドレス", with: "test1@railstest.org"
      fill_in "パスワード", with: "testtest"
      fill_in "確認用パスワード", with: "testtest"
    end

    it "登録できる" do 
      fill_in "名前", with: "test_user1"
      click_on "登録"
      expect(page).to have_content "アカウント登録が完了しました。"
    end

    it "登録に失敗してエラーがでる" do  
      fill_in "名前", with: "test_user_1"
      click_on "登録"
      expect(page).to have_content "は10文字以内で入力してください"
    end
  end
end
