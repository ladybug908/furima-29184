require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nickname,email,password,encrypted_password,frist_name,family_name,frist_name_kana,family_name_kana,birthが全て存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("passwordを入力してください")
      end
      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("password_confirmationを入力してください")
      end
      it "frist_nameが空だと登録できない" do
        @user.frist_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("frist_nameを入力してください")
      end
      it 'frist_nameが全角日本語でないと保存できないこと' do
        @user.frist_name = "ｽｽﾞｷ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading is invalid. Input full-width katakana characters.")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("family_nameを入力してください")
      end
      it "frist_name_kanaが空だと登録できない" do
        @user.frist_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("frist_name_kanaを入力してください")
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("family_name_kanaを入力してください")
      end
      it "birthが空だと登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("birthを入力してください")
      end
    end
  end
end
