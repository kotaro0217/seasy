class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true

      with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数を使用してください' } do
         validates :password
      end

      with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
         validates :first_name
         validates :family_name
      end

      with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'カタカナを使用してください' } do 
         validates :read_first_name
         validates :read_family_name
      end

         validates :birth, presence: true
end
