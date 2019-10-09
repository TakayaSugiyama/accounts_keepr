class Record < ApplicationRecord
  belongs_to :user
  has_many :memos ,dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :label_relations, dependent: :destroy
  has_many :labels, through: :label_relations
  accepts_nested_attributes_for :memos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
  #バリデーション 
  validates :store_name, presence: true 
  validates :purchase_price,presence: true 
  validates :purchase_date,presence: true
  
  #labelとrecordとの関係を作成する
  def  create_label_relation(id)
    LabelRelation.create(label_id: id ,record_id: self.id )
  end

  #labelとrecordとの関係を更新する 
  def update_label_relation(id)
     label_relation = LabelRelation.where(record_id: self.id).first
     label_relation.update(label_id: id, record_id: self.id)
  end

end
