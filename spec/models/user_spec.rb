require 'rails_helper'

RSpec.describe User, type: :model 

  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do 
      it "nickname,email、password,password_confirmation,birthday,surname,first_name,phonetic_name1,phonetic_name2が存在すれば登録できる" do
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
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "@が含まれない場合登録が出来ない" do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは半角数字のみでは登録が出来ない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは半角英字のみでは登録が出来ない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "surnameが空だと登録できない" do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end
      it "surnameは全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.surname = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.first_name = "hiroshi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "phonetic_name1が空だと登録できない" do
        @user.phonetic_name1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phonetic name1 can't be blank")
      end
      it "phonetic_name1は全角（カタカナ）以外では登録できない" do
        @user.phonetic_name1 = "阿部"
        @user.valid?
        expect(@user.errors.full_messages).to include("Phonetic name1 is invalid")
      end
      it "phonetic_name2が空では登録できない" do
        @user.phonetic_name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phonetic name2 can't be blank")
      end
      it "phonetic_name2が全角（カタカナ）以外では登録できない" do
        @user.phonetic_name2 = "宏"
        @user.valid?
        expect(@user.errors.full_messages).to include("Phonetic name2 is invalid")
      end
    end
  end
