require 'rails_helper'

RSpec.describe "ユーザーの新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      fill_in 'user[frist_name]', with: @user.frist_name
      fill_in 'user[family_name]', with: @user.family_name
      fill_in 'user[frist_name_kana]', with: @user.frist_name_kana
      fill_in 'user[family_name_kana]', with: @user.family_name_kana
      select '1980', :from => 'user[birth(1i)]'
      select '1', :from => 'user[birth(2i)]'
      select '1', :from => 'user[birth(3i)]'
      # select '1980', from: '生年月日'
      # select_date '1980/4/20', from: 'Birth date'
      # find("option[value='1980-02-03']").select_option
      # find("option[value='3']").select_option
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: ""
      fill_in 'user[email]', with: ""
      fill_in 'user[password]', with: ""
      fill_in 'user[password_confirmation]', with: ""
      fill_in 'user[frist_name]', with: ""
      fill_in 'user[family_name]', with: ""
      fill_in 'user[frist_name_kana]', with: ""
      fill_in 'user[family_name_kana]', with: ""
      select "-", :from => 'user[birth(1i)]'
      select "-", :from => 'user[birth(2i)]'
      select "-", :from => 'user[birth(3i)]'
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
     # トップページに移動する
     visit root_path
     # トップページにログインページへ遷移するボタンがあることを確認する
     expect(page).to have_content('ログイン')
     # ログインページへ遷移する
     visit new_user_session_path
     # 正しいユーザー情報を入力する
     fill_in 'user[email]', with: @user.email
     fill_in 'user[password]', with: @user.password
     # ログインボタンを押す
     find('input[name="commit"]').click
     # トップページへ遷移することを確認する
     expect(current_path).to eq root_path
     # カーソルを合わせるとログアウトボタンが表示されることを確認する
     expect(page).to have_content('ログアウト')
     # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
     expect(page).to have_no_content('新規登録')
     expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user[email]', with: ""
      fill_in 'user[password]', with: ""
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end

