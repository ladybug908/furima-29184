require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item,user_id: @user.id)
    @item.image = fixture_file_upload('public/image/test.png')
  end

  describe '商品出品' do
    context "商品出品ができる場合" do
      it "全ての条件をクリアしている" do
        expect(@item).to be_valid
      end
    end

    context "商品出品ができない場合" do
      it "画像が空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像をアップロードしてください')
      end
      it "商品名が空だと出品できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it "商品の説明が空だと出品できない" do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it "カテゴリーの選択がないと出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択して下さい')
      end
      it "商品状態の選択がないと出品できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択して下さい')
      end
      it "配送料の選択がないと出品できない" do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択して下さい')
      end
      it "配送元の選択がないと出品できない" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送元の地域を選択して下さい')
      end
      it "発送までの日数の選択がないと出品できない" do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択して下さい')
      end
      it "販売価格が空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end
      it "販売価格が299以下だと出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it "販売価格が1000000以上だと出品できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it "販売価格が半角数字でないと出品できない" do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

      it "ユーザーが紐付いていないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
