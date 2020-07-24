# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Record, type: :model do
  describe '新規投稿機能' do
      let(:user) { create(:user) }
      let(:label)  { FactoryBot.create(:label) }

    context "正常に入力されている時" do
      let!(:record) { create(:record, user_id: user.id, label_id: label.id) }
      it '家計簿を新規で投稿できる' do
        expect(described_class.first.store_name).to eq record.store_name
      end
    end

    describe "バリデーション" do
      context '店の名前がnilの時d' do
        let(:record) { build(:record, store_name: nil) }
        it "エラ-メッセージが返る" do
          record.valid?
          expect(record.errors[:store_name]).to end_with 'を入力してください'
        end
      end

      context '合計金額がnilの時' do
        let(:record) { build(:record, purchase_price: nil) }
        it "エラ〜メッセージ返る" do
          record.valid?
          expect(record.errors[:purchase_price]).to contain_exactly("を入力してください", "は数値で入力してください")
        end
      end

      context '日付がnilの時' do
        let(:record) { build(:record, purchase_date: nil) }
        it "エラーメッセージが返る" do
          record.valid?
          expect(record.errors[:purchase_date]).to end_with 'を入力してください'
        end
      end

      context 'userと紐づいていない時' do
        let(:record) { build(:record, user_id: nil) }
        it "登録出来ない" do
          expect(record.valid?).to eq false
        end
      end

      context 'ラベルと紐づいていない時' do
        let(:record) { build(:record, label_id: nil) }
        it "登録出来ない" do
          expect(record.valid?).to eq false
        end
      end

      context '購入日が未来の日時の時' do
        let(:record) { FactoryBot.build(:record, purchase_date: Date.tomorrow.strftime('%Y-%m-%d')) }
        it '登録出来ない' do
          record.valid?
          expect(record.errors[:purchase_date]).to end_with 'が未来になっています'
        end
      end
    end
  end
end
