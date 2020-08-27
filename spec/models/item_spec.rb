require 'rails_helper'

RSpec.describe Item, type: :model do
  describe User do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('/files/test.png')
    end

    describe '出品がうまいいくとき' do
      context '新規登録がうまくいくとき' do
        it '商品名、画像、商品説明、カテゴリー情報、商品状態、配送料の負担、発送元の地域、発送までの日周、価格が入力されていると商品が出品できる' do
          expect(@item && @item.image).to be_valid
        end
      end

      context '出品機能がうまくいかないとき' do
        it '商品名が空だと登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品説明が空では登録できない' do
          @item.introduction = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Introduction can't be blank")
        end
        it 'カテゴリー 情報が--（空）では登録できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it '商品状態--（空）では登録できない' do
          @item.states_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include('States must be other than 1')
        end
        it '配送料の負担が--（空）では登録できない' do
          @item.delivery_fee_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
        end
        it '発送までの日数が--（空）では登録できない' do
          @item.delivery_day_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
        end
        it '価格が入力されていないと登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格が300円以下だと登録できない' do
          @item.price = '100'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
        it '価格が9999999円以上だと登録できない' do
          @item.price = '10000000000'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
        it '画像がないと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      end
    end
  end
end
