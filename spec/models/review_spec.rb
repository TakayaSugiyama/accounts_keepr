# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'レビュー機能' do
    before do
      @review = FactoryBot.create(:review)
    end

    it 'レビューを作成できる' do
      expect(described_class.first.title).to eq 'test_title1'
    end

    it 'レビューを編集・更新できる' do
      @review.update(title: 'aaaaaaaaaa')
      expect(@review.title).to eq 'aaaaaaaaaa'
    end

    it 'レビューを削除できる' do
      @review.destroy
      expect(described_class.all).to eq []
    end
  end
end
