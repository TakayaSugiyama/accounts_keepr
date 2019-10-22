# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EstimateAmount, type: :model do
  describe 'EstimateAmount' do
    it '作成' do
      estimate_amount = FactoryBot.create(:estimate_amount)
      expect(described_class.all).to include estimate_amount
    end
  end
end
