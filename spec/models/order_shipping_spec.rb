require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: @user.id, item_id: @item.id)
  end

  describe '商品情報登録' do
      context '購入情報が登録できるとき' do
        it 'すべての値が正しく入力されていれば購入できること' do
          expect(@order_shipping).to be_valid
      end
  
      context '内容に問題がある場合' do
        it '郵便番号は空では保存できないこと' do
          @order_shipping.postal_code = ''
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Postal codeを入力してください")
        end
        it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
          @order_shipping.postal_code = '123-123４'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it '都道府県に「---」が選択されている場合は購入できないこと' do
          @order_shipping.prefecture_id = '1'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '市区町村が空だと購入できないこと' do
          @order_shipping.municipality = ''
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Municipalityを入力してください")
        end
        it '番地が空だと購入できないこと' do
          @order_shipping.street_address = ''
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Street addressを入力してください")
        end
        it '電話番号が空だと購入できないこと' do
          @order_shipping.phone_number = nil
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
        end
        it '電話番号が9桁以下だと購入できないこと' do
          @order_shipping.phone_number = '090123456'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
        end
        it '電話番号が12桁以上だと購入できない' do
          @order_shipping.phone_number = '090123456789'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
        end
        it '電話番号が半角数値でないと購入できないこと' do
          @order_shipping.phone_number = '０9012341234'
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
        end
        it 'tokenが空では購入できないこと' do
          @order_shipping.token = nil
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが紐づいていなければ購入できないこと' do
          @order_shipping.user_id = ''
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Userを入力してください")
        end
        it 'item_idが紐づいていなければ購入できないこと' do
          @order_shipping.item_id = ''
          @order_shipping.valid?
          expect(@order_shipping.errors.full_messages).to include("Itemを入力してください")
        end
  
      end
    end

    it "tokenが空では登録できないこと" do
      @order_shipping.token = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
  end
end
end

