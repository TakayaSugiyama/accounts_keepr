# frozen_string_literal: true

require 'rails_helper'

shared_examples 'response the email body' do
  it 'render the body' do
    expect(email.body.encoded).to match  '今月の設定金額'
    expect(email.body.encoded).to match  '今月の使用金額'
  end
end
