class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save {self.email.downcase}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name , presence: true, length: {in: 5..10}
  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_many :estimate_amounts
  has_many :records, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
