# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Label, type: :model do
  describe "ラベル" do 
    it  "ラベル作成機能" do
      label = FactoryBot.create(:label)
      expect(Label.first.name).to eq label.name
    end
  end
end
