require 'rails_helper'

RSpec.describe User, type: :model do
   describe "ユーザー登録"  do 
      it "ユーザーが登録できること"  do  
        user = FactoryBot.build(:user)
        user.save 
        User.first.name = "test_user1"
      end

      describe "名前は5文字以上10文字以下ではないと登録できない。"  do 
         it "名前が4文字のときは登録できない" do  
            user =  FactoryBot.build(:user, name: "あ" * 4)
            user.valid? 
            expect(user.errors[:name]).to include "は5文字以上で入力してください"
         end

         it "名前が11文字のときは登録できない"  do 
            user = FactoryBot.build(:user,name: "あ" * 11)
            user.valid?
            expect(user.errors[:name]).to include "は10文字以内で入力してください"
         end
      end
   end
end
