module  Day 
  extend ActiveSupport::Concern 

  included do 
    @@today = Date.today
    @@last_day = Date.new(@@today.year, @@today.month, -1).strftime('%Y-%m-%d')
    @@first_day = Date.new(@@today.year, @@today.month).strftime('%Y-%m-%d')
    @@premonth_first_day = (Date.new(@@today.year, @@today.month) << 1).strftime('%Y-%m-%d')
    @@premonth_last_day = (Date.new(@@today.year, @@today.month, -1) << 1).strftime('%Y-%m-%d')
  end
  
end