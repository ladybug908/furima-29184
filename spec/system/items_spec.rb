require 'rails_helper'

RSpec.describe '商品出品機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    #@item.image = fixture_file_upload('public/image/test.png')
    #@titem_image = Faker::Lorem.sentence
    @item = FactoryBot.build(:item)
    #@titem_name = Faker::Lorem.sentence
    #@item_introduction = Faker::Lorem.sentence
  end
  context '商品出品ができるとき'do
    it 'ログインしたユーザーは商品出品できる' do
      # ログインする
      sign_in(@user)
      # 出品ページへのリンクがあることを確認する
      expect(page).to have_content('出品する')
      # 出品ページに移動する
      visit new_item_path
      # フォームに情報を入力する
      image_path = Rails.root.join('public/image/test.png')
      # 画像選択フォームに画像を添付する
      attach_file('item[image]', image_path)
      #fill_in 'item[image]', with: @item_image
      fill_in 'item[item_name]', with: @item.item_name
      fill_in 'item[introduction]', with: @item.introduction
      select 'レディース', :from => 'item[category_id]'
      select '新品・未使用', :from => 'item[status_id]'
      select '着払い（購入者負担）', :from => 'item[postage_id]'
      select '北海道', :from => 'item[area_id]'
      select '１日〜２日で発送', :from => 'item[day_id]'
      fill_in 'item[price]', with: @item.price
      # 送信するとItemモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq root_path
      # トップページには先ほど出品した商品が存在することを確認する（画像）
      expect(page).to have_selector("img")
      # トップページには先ほど出品した商品が存在することを確認する（商品名）
      expect(page).to have_content(@item.item_name)
      # トップページには先ほど出品した商品が存在することを確認する（価格）
      expect(page).to have_content(@item.price)
    end
  end
  context '出品ができないとき'do
    it 'ログインしていないと出品ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # ログインせずに出品ページへ遷移しない
      expect(page).to have_content('出品する')
    end
  end
end