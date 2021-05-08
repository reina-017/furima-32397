require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id, order: @user.id )

  end


  describe '商品購入機能' do
    it 'postcode、prefecture_id、city、block、building、phone_numberが存在すれば購入できる' do
      expect(@order_form).to be_valid
    end
    it 'postcodeが空では購入できない' do
      @postcode = ''
      @order_form.valid?
      expect(@user.errors.full_messages).to include()

    end
    it 'postcodeはハイフン無しでは購入できない' do
      @postcode = '1111111'
      @order_form.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'prefecture_idが空では購入できない' do
      @prefecture_id = ''
      @order_form.valid?
      expect(@user.errors.full_messages).to include()

    end
    it 'cityが空では購入できない' do
      @city = ''
      @order_form.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'blockが空では購入できない' do
      @block = ''
      @order_form.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'buildingが空では購入できない' do
      @building = ''
      @order_form.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'phone_numberが空では購入できない' do
      @phone_number = ''
      @order_form.valid?
      expect(@user.errors.full_messages).to include()
    end
    # it 'phone_numberは12桁では購入できない' do
    # end
    # it 'phone_numberは数字のみ' do
    # end

  end
end