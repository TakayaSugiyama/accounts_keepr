class Label < ApplicationRecord
   has_many :records, dependent: :destroy
end
