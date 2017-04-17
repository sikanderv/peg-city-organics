class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :attachments, as: :parent, dependent: :destroy

  validates :name, presence: true
  validates :name, presence: true
end
