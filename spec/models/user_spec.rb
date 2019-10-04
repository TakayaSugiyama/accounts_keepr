require 'rails_helper'

RSpec.describe User, type: :model do
   describe "ユーザー登録"  do 
      it "ユーザーが登録できること"  do  
        user = FactoryBot.build(:user)
        user.save 
        User.first.name = "test_user1"
      end
   end
end
