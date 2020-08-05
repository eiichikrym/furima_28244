require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item, :with_image)
  end

  describe '商品の出品' do
    context '商品の出品成功' do
      it '①必要な情報が全てが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品失敗' do
      it '商品画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーを選択していないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態を選択していないと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it '配送料の負担を選択していないと出品できない' do
        @item.ship_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship charge must be other than 1')
      end

      it '発送元の地域を選択していないと出品できない' do
        @item.ship_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship region must be other than 1')
      end

      it '発送までの日数を選択していないと出品できない' do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship day must be other than 1')
      end

      it '価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end

      it '価格が300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が9999999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
