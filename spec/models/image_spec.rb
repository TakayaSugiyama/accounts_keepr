# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  describe '画像' do
    it '画像を登録できる' do
      image = FactoryBot.create(:image)
      expect(described_class.first).to eq image
    end
  end
end
