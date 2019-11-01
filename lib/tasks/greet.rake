namespace :greet do
   desc "テスト"
   task task_test: :environment do 
      puts "hello"
   end 
end
