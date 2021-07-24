require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品ができる時' do
     it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、発送料の負担、発送元の地域、発送までの日数、販売価格が存在すれば登録できる' do
       expect(@product).to be_valid
     end

      it '販売価格が300円〜9,999,999円以内であれば登録できる' do
        @product.price = 300
        expect(@product).to be_valid
      end

      it '販売価格が半角数字であれば登録できる' do
        @product.price = 400
        expect(@product).to be_valid
      end
    end

    context '商品出品ができない時' do
      it '商品画像が無いと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が無いと登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
 
      it '商品の説明が無いと登録できない' do
        @product.text = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリーが未選択だと登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が未選択だと登録できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担が未選択だと登録できない' do
        @product.shopping_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shopping charge can't be blank")
      end

      it '配送料の負担が未選択だと登録できない' do
        @product.shopping_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shopping charge can't be blank")
      end

      it '発送元の地域が未選択だと登録できない' do
        @product.delivery_area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '発送までの日数が未選択だと登録できない' do
        @product.delivery_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day can't be blank")
      end

      it '販売価格が未入力と登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が半角数字以外だと登録できない' do
        @product.price = '５０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end

      it '販売価格が半角数字以外だと登録できない' do
        @product.price = 'abcdefgh'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end

      it '販売価格が300円未満だと登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end

      it '販売価格が10,000,000円以上だと登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end
