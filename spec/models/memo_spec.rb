# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Memo, type: :model do
  describe 'memoのCRUD機能' do
    before do
      @memo = FactoryBot.create(:memo)
    end

    it '作成機能' do
      expect(described_class.first.content).to eq @memo.content
    end

    it '編集・更新機能' do
      @memo.update(content: 'test_title')
      expect(@memo.content).to eq @memo.content
    end

    it '削除機能' do
      @memo.destroy
      expect(described_class.all).to eq []
    end
  end
end
