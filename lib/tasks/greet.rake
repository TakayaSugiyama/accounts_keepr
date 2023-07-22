# frozen_string_literal: true

namespace :greet do
  desc 'テスト'
  task task_test: :environment do
    puts 'hello'
  end

  desc 'おはよう'
  task morning: :environment do
    puts 'おはよう'
  end
end
