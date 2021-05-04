class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :day


  with_options presence: true do 
    validates :name
    validates :description
    validates :item_price
    validates :user
  end
  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :cost_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 0 } 
  validates :days_id, numericality: { other_than: 1 } 
end
