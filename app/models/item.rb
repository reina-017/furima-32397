class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do 
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :area_id
    validates :days_id
    validates :item_price
    validates :user
  end
end
