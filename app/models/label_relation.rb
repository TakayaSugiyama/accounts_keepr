class LabelRelation < ApplicationRecord
  belongs_to :label
  belongs_to :record
end
