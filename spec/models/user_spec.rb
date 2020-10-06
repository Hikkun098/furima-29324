require 'rails_helper'

RSpec.describe User, type: :model 

  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do 
      it "nickname,email,password,password_confirmation,birthday,surname,first_name,surname_phonetic,first_name_phoneticが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "@が含まれない場合登録が出来ない" do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください",)
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordは半角数字のみでは登録が出来ない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordは半角英字のみでは登録が出来ない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it "surnameが空だと登録できない" do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("妙字を入力してください")
      end
      it "surnameは全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.surname = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("妙字は不正な値です")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.first_name = "hiroshi"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it "surname_phoneticが空だと登録できない" do
        @user.surname_phonetic = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("妙字(フリガナ)を入力してください")
      end
      it "surname_phoneticは全角（カタカナ）以外では登録できない" do
        @user.surname_phonetic = "阿部"
        @user.valid?
        expect(@user.errors.full_messages).to include("妙字(フリガナ)は不正な値です")
      end
      it "first_name_phoneticが空では登録できない" do
        @user.first_name_phonetic = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(フリガナ)を入力してください")
      end
      it "first_name_phoneticが全角（カタカナ）以外では登録できない" do
        @user.first_name_phonetic = "宏"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(フリガナ)は不正な値です")
      end
    end
  end
