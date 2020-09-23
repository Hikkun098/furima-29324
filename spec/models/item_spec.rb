require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    context '商品出品がうまくいくとき' do 
      it "image,item_name,description,category_id,status_id,fee_id,area_id,day_id,price,userが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "descriptionが空では登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idで1が選択された場合、出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idで1が選択された場合、出品できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "fee_idで1が選択された場合、出品できない" do
        @item.fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end
      it "area_idで1が選択された場合、出品できない" do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "day_idで1が選択された場合、出品できない" do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥300未満であれば登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが¥9999999よりも高ければ登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceは半角数字でなければ登録できない" do
        @item.price ='abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "ユーザーに紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
  end
end