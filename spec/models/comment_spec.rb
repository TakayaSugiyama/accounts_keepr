# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメントのCRUD' do
    before do
      @comment = FactoryBot.create(:comment)
    end

    it 'コメント作成' do
      expect(described_class.all).to include @comment
    end

    it 'コメント編集・更新できる' do
      @comment.update(content: 'this comment is updated!!')
      expect(@comment.content).to eq 'this comment is updated!!'
    end

    it 'コメント編集・更新に失敗する' do
      @comment.update(content: 'あ' * 201)
      expect(@comment.errors[:content]).to include 'は200文字以内で入力してください'
    end
  end
end
