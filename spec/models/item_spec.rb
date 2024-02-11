require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end
  
  describe '商品情報登録' do
    context '商品情報が登録できるとき' do
      it '正常に登録できるとき' do
        expect(@item).to be_valid
      end
    end
  
    context '商品情報が登録できないとき' do
      it 'itemが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item nameを入力してください"
      end
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Imageを入力してください"
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category を入力してください"
      end
      it '商品の状態が空では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition を入力してください"
      end
      it '配送料の負担情報が空では登録できない' do
        @item.cost_bearer_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost bearer を入力してください"
      end      
      it '発送元の地域情報が空では登録できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area を入力してください"
      end
      it '発送までの日数情報が空では登録できない' do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day を入力してください"
      end
      it '価格情報が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Priceを入力してください"
      end
      it '価格は￥299以下の場合は登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Priceは一覧にありません"
      end
      it '価格は￥1,000,000以上の場合は登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Priceは一覧にありません"
      end
      it '価格は半角数値でなければ登録できない' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Priceは一覧にありません"
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end

    end
  end
end