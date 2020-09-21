require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before '商品購入情報の保存' do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, image: fixture_file_upload('public/image/test.png'), user_id: @user1.id,)
    sleep 0.5
    @user_purchase = FactoryBot.build(:user_purchase, user_id: @user2.id, item_id: @item.id)
  end
  
  describe '商品購入' do
    context '商品購入ができる場合' do
      it '全ての条件をクリアしている' do
        expect(@user_purchase).to be_valid
      end
    end
    
    context '商品購入ができない場合' do
      it 'クレジット情報が空だと出品できない' do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("クレジット情報を入力してください")
      end
      it '郵便番号が空だと購入できない' do
        @user_purchase.postal_code = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('郵便番号を入力してください')
      end
      it '郵便番号にハイフンがないと購入できない' do
        @user_purchase.postal_code = '1234567'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '郵便番号が全角だと購入できない' do
        @user_purchase.postal_code = "１２３−４５６７"
        @user_purchase.valid?
        #binding.pry
        expect(@user_purchase.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県が空だと購入できない' do
        @user_purchase.area_id = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("都道府県を選択して下さい")
      end
      it '都道府県の選択肢が０だと購入できない' do
        @user_purchase.area_id = '0'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("都道府県を選択して下さい")
      end
      it '市区町村が空だと購入できない' do
        @user_purchase.city = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空だと購入できない' do
        @user_purchase.block = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと購入できない' do
        @user_purchase.tel = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が12桁以上だと購入できない' do
        @user_purchase.tel = '123456789012'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号に-（ハイフン）が入ると購入できない' do
        @user_purchase.tel = '090-123-456'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end