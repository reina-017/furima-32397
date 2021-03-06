class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :days

  with_options presence: true do
    validates :name
    validates :description
    validates :user
    validates :image
  end

  with_options numericality: { only_integer: true, other_than: 1 } do
    validates :category_id
    validates :cost_id
    validates :status_id
    validates :area_id
    validates :days_id
  end
  validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300,  less_than_or_equal_to: 9_999_999 }
end
