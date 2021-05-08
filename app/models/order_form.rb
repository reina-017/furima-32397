class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :order

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :prefecture_id
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'を入力してください' }
    validates :order

   with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :city
    validates :block
   end
  end
    validates :building, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }

    def save
      # 購入記録の情報を保存
      order = Order.create(user_id: user_id, item_id: item_id )
      # 住所の情報を保存
      Destination.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block:  block, building: building,  phone_number: phone_number, order_id: order.id )
    end
end