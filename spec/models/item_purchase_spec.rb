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
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_purchase).to be_valid
    end

    it 'valueとtokenがあれば保存ができること' do
      expect(@item_purchase).to be_valid
    end

    it 'buildingはなくても保存ができること' do
      expect(@item_purchase).to be_valid
    end
  end

    context '商品購入ができない時' do
    it 'postcodeが空だと保存できないこと' do
      @item_purchase.postcode = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Postcodeを入力してください')
    end

    it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @item_purchase.postcode = '0000000'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Postcode郵便番号には半角ハイフンが必要である')
    end

    it 'prefectureを選択していないと保存できないこと' do
      @item_purchase.prefecture_id = 1
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Prefectureは空欄以外を選択してください')
    end

    it 'cityは空では保存できないこと' do
      @item_purchase.city = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Cityを入力してください')
    end

    it 'blockは空では保存できないこと' do
      @item_purchase.block = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Blockを入力してください')
    end

    it 'phoneが空だと保存できないこと' do
      @item_purchase.phone = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Phoneを入力してください')
    end

    it '電話番号が英数字混合では登録できないこと' do
      @item_purchase.phone = '0000000000a'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('')
    end

    it 'phoneが11桁以内であること' do
      @item_purchase.phone = '000000000000'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Phoneは11文字以下に設定して下さい。')
    end

    it 'tokenが空では登録できないこと' do
      @item_purchase.token = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Tokenを入力してください')
    end

    it 'itme_idが空では登録できないこと' do
      @item_purchase.item_id = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Itemを入力してください')
    end

    it 'user_idが空では登録できないこと' do
      @item_purchase.user_id = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Userを入力してください')
    end
  end
end
end
