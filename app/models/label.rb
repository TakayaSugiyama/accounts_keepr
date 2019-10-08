class Label < ApplicationRecord 
   has_many :label_relations 
   has_many :records, through: :label_relations
end
