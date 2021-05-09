require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id, order: @user.id )
    sleep(0.1)

  end


  describe '商品購入機能' do
   context '商品購入できるとき' do
    it 'postcode、prefecture_id、city、block、building、phone_number、tokenが存在すれば購入できる' do
      expect(@order_form).to be_valid
    end
   end
   context '商品購入できないとき' do
    it "tokenが空では購入できない" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it 'postcodeが空では購入できない' do
      @order_form.postcode = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postcode can't be blank", "Postcode を入力してください")

    end
    it 'postcodeはハイフン無しでは購入できない' do
      @order_form.postcode = '1111111'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postcode を入力してください")
    end
    it 'prefecture_idが空では購入できない' do
      @order_form.prefecture_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")

    end
    it 'cityが空では購入できない' do
      @order_form.city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空では購入できない' do
      @order_form.block = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Block can't be blank")
    end
    it 'phone_numberが空では購入できない' do
      @order_form.phone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank", "Phone number を入力してください")
    end
    it 'phone_numberは12桁以上では購入できない' do
      @order_form.phone_number = '00000000000000'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number を入力してください")
    end
    it 'phone_numberは数字のみ' do
      @order_form.phone_number = 'あああああああああああ'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number を入力してください")
    end
  end
  end
end