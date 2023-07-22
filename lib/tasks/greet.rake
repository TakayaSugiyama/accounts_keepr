# frozen_string_literal: true

namespace :greet do
  desc 'テスト'
  task task_test: :environment do
    puts 'hello'
  end

  desc 'テスト2'
  task task_test2: :environment do
    puts 'hello2'
  end
end
