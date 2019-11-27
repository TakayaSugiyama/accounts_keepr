# frozen_string_literal: true

module Day
  extend ActiveSupport::Concern

  included do
    @@today = Date.today
    @@last_day = Date.new(@@today.year, @@today.month, -1).strftime('%Y-%m-%d')
    @@first_day = Date.new(@@today.year, @@today.month).strftime('%Y-%m-%d')
    @@premonth_first_day = (Date.new(@@today.year, @@today.month) << 1).strftime('%Y-%m-%d')
    @@premonth_last_day = (Date.new(@@today.year, @@today.month, -1) << 1).strftime('%Y-%m-%d')

    class << self 
      def get_today
        @@today
      end
  
      def get_first_day
        @@first_day
      end
  
      def get_last_day
        @@last_day
      end
  
      def get_premonth_first_day
        @@premonth_first_day
      end
    end
  end
end
