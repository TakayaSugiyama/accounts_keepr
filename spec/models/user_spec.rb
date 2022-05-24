# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    it 'ユーザーが登録できること' do
      user = FactoryBot.build(:user)
      user.save
      expect(described_class.last.name).to eq user.name
    end

    describe '名前は1文字以上30文字以下ではないと登録できない。' do
      it '名前が0文字のときは登録できない' do
        user = FactoryBot.build(:user, name: '')
        user.valid?
        expect(user.errors[:name]).to include 'は1文字以上で入力してください'
      end

      it '名前が31文字のときは登録できない' do
        user = FactoryBot.build(:user, name: 'あ' * 31)
        user.valid?
        expect(user.errors[:name]).to include 'は30文字以内で入力してください'
      end
    end
  end

  describe 'ユーザー情報を変更できる' do
    before do
      @user = FactoryBot.create(:user)
      @user.skip_confirmation_notification!
    end

    it '正常に名前を更新できる' do
      @user.update(name: 'test_user_updated')
      expect(@user.name).to eq 'test_user_updated'
    end

    it '正常にメールアドレスを更新できる' do
      @user.skip_reconfirmation!
      @user.update(email: 'aaaaa@aaaaaa.com')
      expect(@user.email).to eq 'aaaaa@aaaaaa.com'
    end

    it '名前の更新に失敗する' do
      @user.update(name: 'あ' * 31)
      expect(@user.errors[:name]).to include 'は30文字以内で入力してください'
    end

    it 'メールアドレスの更新に失敗する' do
      @user.update(email: 'ffoawfjoa@fijwaifjewoigja')
      expect(@user.errors[:email]).to include 'は不正な値です'
    end
  end
end
