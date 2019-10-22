# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Label, type: :model do
  describe 'ラベル' do
    before do
      @label = FactoryBot.create(:label)
    end

    it 'ラベル作成機能' do
      expect(described_class.all).to include @label
    end
  end
end
