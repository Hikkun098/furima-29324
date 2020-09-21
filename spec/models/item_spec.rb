require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do 
      it "image,item_name,description,category_id,status_id,fee_id,area_id,days_id,price,userが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空では登録できない" do
        @item.image = ''
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
      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category id can't be blank")
      end
      it "status_idが空では登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status id can't be blank")
      end
      it "fee_idが空では登録できない" do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee id can't be blank")
      end
      it "area_idが空では登録できない" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area id can't be blank")
      end
      it "days_idが空では登録できない" do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days_id can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥300未満であれば登録できない" do
      end
      it "priceが¥9999999よりも高ければ登録できない" do
      end
      it "priceは半角数字でなければ登録できない" do
      end
    end
  end
end