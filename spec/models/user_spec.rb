require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'nickname,email,password,encrypted_password,frist_name,family_name,frist_name_kana,family_name_kana,birthが全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailは@を含まなければ登録できない' do
        @user.email = 'nnngmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが6文字以上かつ英数混在であれば登録できる' do
        @user.password = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordは半角英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordは半角数字だけでは登録できない' do
        @user.password = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'frist_nameが空だと登録できない' do
        @user.frist_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（全角）を入力してください')
      end
      it 'frist_nameが全角日本語でないと保存できないこと' do
        @user.frist_name = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（全角）は不正な値です')
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（全角）を入力してください')
      end
      it 'family_nameが全角日本語でないと保存できないこと' do
        @user.family_name = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（全角）は不正な値です')
      end
      it 'frist_name_kanaが空だと登録できない' do
        @user.frist_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（カナ）を入力してください')
      end
      it 'frist_name_kanaがカタカナでないと保存できないこと' do
        @user.family_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（カナ）は不正な値です')
      end
      it 'family_name_kanaが空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（カナ）を入力してください')
      end
      it 'family_name_kanaがカタカナでないと保存できないこと' do
        @user.family_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（カナ）は不正な値です')
      end
      it 'birthが空だと登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
