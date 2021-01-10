require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品の出品' do
    context '商品出品がうまくいくとき' do
      it "出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が存在すれば登録できること" do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品がうまくいかないとき' do
      it "画像が１枚ないと登録できない" do
        @item.image = nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end
      
      it "商品名がないと登録できない" do
        @item.name = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      
      it "商品説明がないと登録できない" do
        @item.text = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it "カテゴリーを選択していないと登録できない" do
        @item.category_id = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include("カテゴリーは空欄以外を選択してください")
      end

      it "商品の状態を選択していないと登録できない" do
        @item.condition_id = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include("商品の状態は空欄以外を選択してください")
      end

      it "配送料の負担を選択していないと登録できない" do
        @item.postage_id = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include("配送料の負担は空欄以外を選択してください")
      end

      it "発送元の地域を選択していないと登録できない" do
        @item.prefecture_id = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include("発送元の地域は空欄以外を選択してください")
      end

      it "発送までの日数を選択していないと登録できない" do
        @item.shipment_day_id = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include("発送までの日数は空欄以外を選択してください")
      end
      

      it "価格がないと登録できない" do
        @item.value = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it "販売価格が299以下だと登録できない" do
        @item.value = 299
        @item.valid? 
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end

      it "販売価格が10000000以上だ登録できない" do
        @item.value = 10000000
        @item.valid? 
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end

      it "販売価格は全角文字では登録できないこと" do
        @item.value = "あ"
        @item.valid? 
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end

      it "販売価格は半角英数混合では登録できないこと" do
        @item.value = "1a"
        @item.valid? 
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end

      it "販売価格は半角英語だけでは登録できないこと" do
        @item.value = "a"
        @item.valid? 
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      

    end
  end
end

