require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '出品がうまいいくとき' do
    context '新規登録がうまくいくとき' do
      it "商品名、画像、商品説明、カテゴリー情報、商品状態、配送料の負担、発送元の地域、発送までの日周、価格が入力されていると商品が出品できる" do
      end
      it "商品の値段が300円以上9,999,999円以内であれば出品できる" do
      end
    end

    context '出品機能がうまくいかないとき' do
      it "商品名が空だと登録できない" do
      end
      it "商品説明が空では登録できない" do
      end
      it "カテゴリー 情報が空では登録できない" do
      end
      it "商品状態が空では登録できない" do
      end
      it "配送料の負担が空では登録できない" do
      end
      it "発送元の地域が空では登録できない" do
      end
      it "発送までの日数が空では登録できない" do
      end
      it "価格が入力されていないと登録できない" do
      end
      it "画像がないと登録できない" do
      end
    end
  end
end
