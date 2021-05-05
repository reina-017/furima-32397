require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do 
   context '商品出品できるとき' do
    it 'name、description、category_id、status_id、cost_id、area_id、days_id、item_priceが存在すれば出品できる' do 
      expect(@item).to be_valid
    end
   end
   context'商品出品できないとき' do
    it 'nameが空では出品できない' do 
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'imageが空では出品できない' do 
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'category_idが空では出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it 'category_idが1では出品できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'status_idが空では出品できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status is not a number")
    end
    it 'status_idが1では出品できない' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it 'cost_idが空では出品できない' do
      @item.cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost is not a number")
    end
    it 'cost_idが1では出品できない' do
      @item.cost_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost must be other than 1")
    end
    it 'area_idが空では出品できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area is not a number")
    end
    it 'area_idが0では出品できない' do
      @item.area_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 0")
    end
    it 'days_idが空では出品できない' do
      @item.days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days is not a number")
    end
    it 'days_idが1では出品できない' do
      @item.days_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Days must be other than 1")
    end
    it 'item_priceが空では出品できない' do
      @item.item_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is not a number")
    end
    it 'item_priceが300円以下では出品できない' do
      @item.item_price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be greater than 300")
    end
    it 'item_priceが9999999円以上では出品できない' do
      @item.item_price = '999999999999'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be less than 9999999")
    end
    it 'item_priceは半角数字のみ保存可能' do
      @item.item_price = 'あああ'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is not a number")
    end
   end
  end
end