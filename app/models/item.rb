class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :shipment_day
  belongs_to :postage
  belongs_to :prefecture

  with_options presence: true do
    validates :name
    validates :text
    validates :value,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, format: { with: /^[0-9]+$/ } }
    validates :image
  end

  with_options numericality: { other_than: 1, message: 'は空欄以外を選択してください' } do # 〇〇以外は
    validates :condition_id
    validates :category_id
    validates :shipment_day_id
    validates :postage_id
    validates :prefecture_id
  end
end
