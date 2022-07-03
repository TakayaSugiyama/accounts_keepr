# frozen_string_literal: true

require 'rails_helper'

describe BeyondMailer, type: :mailer do
  context '.notify' do
    let(:user) { FactoryBot.create(:user, email: 's.takaya1027@example.com') }
    let(:estimate_amount) { FactoryBot.create(:estimate_amount) }
    let(:sum_price) { 100 }

    let(:email) { BeyondMailer.beyond_mail(user, estimate_amount, sum_price) }

    it 'renders the headers' do
      expect(email.subject).to eq '今月の設定金額を超えました。'
      expect(email.to).to eq %w[s.takaya1027@example.com]
      expect(email.from).to eq %w[from@example.com]
    end

    it_behaves_like 'response the email body'
  end
end
