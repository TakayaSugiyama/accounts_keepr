class Label < ApplicationRecord 
   has_many :label_relations , dependent: :destroy
   has_many :records, through: :label_relations, dependent: :destroy
end
