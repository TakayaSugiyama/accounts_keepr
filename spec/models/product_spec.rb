# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品投稿機能' do
    before do
      @product = FactoryBot.create(:product)
    end

    it '商品を投稿できる' do
      expect(described_class.first.name).to eq @product.name
    end

    it '商品情報を更新する' do
      @product.update(name: 'aaaaaaaaaaaaa')
      expect(@product.name).to eq 'aaaaaaaaaaaaa'
    end

    it '商品情報を削除できる' do
      @product.destroy
      expect(described_class.all).to eq []
    end
  end
end
