require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe PurchaseAddress do  
    before do
      @purchaseaddress = FactoryBot.build(:purchase_address)
    end

    describe '商品購入' do
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchaseaddress).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchaseaddress.building_name = ''
        expect(@purchaseaddress).to be_valid
      end
    end

    context '購入がうまくいかないとき' do  
      it 'postal_codeが空だと保存できないこと' do
        @purchaseaddress.postal_code = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが数字３文字、ハイフン、数字４文字でないと保存できないこと' do
        @purchaseaddress.postal_code = '0000000'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Postal code is invalid")
      end
      it 'cityが空だと保存できないこと' do
        @purchaseaddress.city = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchaseaddress.house_number = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("House number can't be blank")
      end
      it 'tel_numberが空だと保存できないこと' do
        @purchaseaddress.tel_number = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが11文字以上だと保存できないこと' do
        @purchaseaddress.tel_number = '000000000000'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Tel number is too long (maximum is 11 characters)")
      end
      it 'トークンが生成されないと保存できないこと' do
        @purchaseaddress.token = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
end
