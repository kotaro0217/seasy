require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @item_purchase = FactoryBot.build(:item_purchase, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '商品購入できるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@item_purchase).to be_valid
      end

      it '建物名はなくても保存ができる' do
        @item_purchase.building = ''
        expect(@item_purchase).to be_valid
      end
    end

    context '商品購入ができない時' do
      it '郵便番号が空欄だと保存できません' do
        @item_purchase.postcode = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('郵便番号を入力してください')
      end

      it '郵便番号は半角ハイフンを含んだ正しい形でないと保存できません' do
        @item_purchase.postcode = '0000000'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('郵便番号には半角ハイフンが必要である')
      end

      it '都道府県は空欄以外を選択していないと保存できません' do
        @item_purchase.prefecture_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('都道府県は空欄以外を選択してください')
      end

      it '市町村が空欄では保存できません' do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('市町村を入力してください')
      end

      it '番地が空欄では保存できません' do
        @item_purchase.block = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('番地を入力してください')
      end

      it '電話番号が空欄だと保存できません' do
        @item_purchase.phone = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('電話番号を入力してください')
      end

      it '電話番号が英数字混合では登録できません' do
        @item_purchase.phone = '0000000000a'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('電話番号は半角数字のみで入力する')
      end

      it '電話番号が11桁以内であること' do
        @item_purchase.phone = '000000000000'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('電話番号は11文字以下に設定して下さい。')
      end

      it 'クレジットカード情報が空欄では登録できません' do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('クレジットカード情報を入力してください')
      end

      it 'itme_idが空では登録できません' do
        @item_purchase.item_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Itemを入力してください')
      end

      it 'user_idが空では登録できません' do
        @item_purchase.user_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
