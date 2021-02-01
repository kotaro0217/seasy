class ItemPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :postcode, :prefecture_id, :city, :block, :building, :phone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: '郵便番号には半角ハイフンが必要である' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'は空欄以外を選択してください' }
    validates :city
    validates :block
    validates :phone, numericality: { message: '半角数字のみで入力する' }, length: { maximum: 11 }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building,
                           phone: phone, purchase_id: purchase.id)
  end
end
