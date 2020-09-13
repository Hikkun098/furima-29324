require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname:"")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(email:"")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが一意性である" do
    end
    it "emailは@を含む必要がある" do
    end
    it "passwordが空だと登録できない" do
      user = User.new(password:"")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは6文字以上である" do
    end
    it "passwordは半角英数字混合である" do
    end
    it "passwordは確認用を含めて2回入力する" do
    end
    it "birthdayが空では登録できない" do
      user = User.new(birthday:"")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "surnameが空だと登録できない" do
      user = User.new(surname:"")
      user.valid?
      expect(user.errors.full_messages).to include("Surname can't be blank")
    end
    it "surnameは全角（漢字・ひらがな・カタカナ）で入力させる" do
    end
    it "first_nameが空では登録できない" do
      user = User.new(first_name:"")
      user.valid?
      expect(user.errors.full_messages).to include("First_name can't be blank")
    end
    it "first_nameは全角（漢字・ひらがな・カタカナ）で入力させる" do
    end
    it "phonetic_name1が空だと登録できない" do
      user = User.new(phonetic_name1:"")
      user.valid?
      expect(user.errors.full_messages).to include("Phonetic_name1 can't be blank")
    end
    it "phonetic_name1のフリガナは全角（カタカナ）で入力させる" do
    end
    it "phonetic_name2が空では登録できない" do
      user = User.new(phonetic_name2:"")
      user.valid?
      expect(user.errors.full_messages).to include("Phonetic_name2 can't be blank")
    end
    it "phonetic_name2のフリガナは全角（カタカナ）で入力させる" do
    end
    it "新規登録・ログイン共にエラーハンドリングができている" do
    end
  end
end
