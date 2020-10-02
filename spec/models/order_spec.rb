require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
    before do
      @order = FactoryBot.build(:order)
  end

  context '商品購入がうまくいくとき' do

  end

  context '商品購入がうまくいかないとき' do
    
  end
end
