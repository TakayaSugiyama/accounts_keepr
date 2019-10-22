# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Record, type: :model do
  describe '新規投稿機能' do
    before do
      @user = FactoryBot.create(:user)
      @label = FactoryBot.create(:label)
    end

    it '家計簿を新規で投稿できる' do
      record = FactoryBot.create(:record, user_id: @user.id, label_id: @label.id)
      expect(described_class.first.store_name).to eq record.store_name
    end

    it '店の名前がnilだと登録できない' do
      record = FactoryBot.build(:record, store_name: nil)
      record.valid?
      expect(record.errors[:store_name]).to include 'を入力してください'
    end

    it '合計金額がnilだと登録できない' do
      record = FactoryBot.build(:record, purchase_price: nil)
      record.valid?
      expect(record.errors[:purchase_price]).to include 'を入力してください'
    end

    it '日付がnilだと登録できない' do
      record = FactoryBot.build(:record, purchase_date: nil)
      record.valid?
      expect(record.errors[:purchase_date]).to include 'を入力してください'
    end

    it 'ユーザー選択しないと登録できない' do
      record = FactoryBot.build(:record, user_id: nil)
      expect(record.valid?).to eq false
    end

    it 'ラベルを選択しないと登録できない' do
      record = FactoryBot.build(:record, label_id: nil)
      expect(record.valid?).to eq false
    end
  end
end
