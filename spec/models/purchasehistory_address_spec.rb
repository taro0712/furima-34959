require 'rails_helper'

RSpec.describe PurchasehistoryAddress, type: :model do
  describe '商品購入の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @purchasehistory_address = FactoryBot.build(:purchasehistory_address, user_id: user.id, product_id: product.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it '全ての情報があれば保存できる' do
        expect(@purchasehistory_address).to be_valid
      end

      it '建物名は空でも保存できる' do
        @purchasehistory_address.building = ''
        expect(@purchasehistory_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では、保存できない' do
        @purchasehistory_address.postcode = ''
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号は「-」がないと、保存できない' do
        @purchasehistory_address.postcode = '1234567'
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it '都道府県が空では、保存できない' do
        @purchasehistory_address.delivery_area_id = 1
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '市区町村が空では、保存できない' do
        @purchasehistory_address.city = ''
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では、保存できない' do
        @purchasehistory_address.block = ''
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空では、保存できない' do
        @purchasehistory_address.phone_number = ''
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は9桁以下だと、保存できない' do
        @purchasehistory_address.phone_number = '090123456'
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include('Phone number is too short')
      end

      it '電話番号は12桁以上だと、保存できない' do
        @purchasehistory_address.phone_number = '090123456789'
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include('Phone number is too long')
      end

      it '電話番号は半角数値以外だと、保存できない' do
        @purchasehistory_address.phone_number = '０９０１２３４５６７８'
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'tokenが空だと、保存できない' do
        @purchasehistory_address.token = nil
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include("Token can't be blank")
      end

      it '商品が空だと、保存できない' do
        @purchasehistory_address.product_id = nil
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include("Product can't be blank")
      end

      it '購入者が空だと、保存できない' do
        @purchasehistory_address.user_id = nil
        @purchasehistory_address.valid?
        expect(@purchasehistory_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
