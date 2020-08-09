require 'rails_helper'

describe TradingInformation do
  before do
    @trading_information = FactoryBot.build(:trading_information)
  end

  describe '商品の購入' do
    context '購入成功' do
      it '①配送先情報が存在すれば購入できる' do
        expect(@trading_information).to be_valid
      end

      it '②建物名が空でも購入できる' do
        @trading_information.building = nil
        expect(@trading_information).to be_valid
      end
    end

    context '購入失敗' do
      it '③郵便番号が空の場合は登録できない' do
        @trading_information.postcode = nil
        @trading_information.valid?
        expect(@trading_information.errors.full_messages).to include("Postcode can't be blank", 'Postcode is invalid')
      end

      it '④郵便番号にハイフンが入力されていない場合は登録できない' do
        @trading_information.postcode = '1234567'
        @trading_information.valid?
        expect(@trading_information.errors.full_messages).to include('Postcode is invalid')
      end

      it '⑤都道府県が空の場合は登録できない' do
        @trading_information.state_id = '1'
        @trading_information.valid?
        expect(@trading_information.errors.full_messages).to include('State must be other than 1')
      end

      it '⑥市区町村が空の場合は登録できない' do
        @trading_information.city = nil
        @trading_information.valid?
        expect(@trading_information.errors.full_messages).to include("City can't be blank")
      end

      it '⑦番地が空の場合は登録できない' do
        @trading_information.block = nil
        @trading_information.valid?
        expect(@trading_information.errors.full_messages).to include("Block can't be blank")
      end

      it '⑧電話番号が空の場合は登録できない' do
        @trading_information.phone_number = nil
        @trading_information.valid?
        expect(@trading_information.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end

      it '⑨電話番号が12桁以上の場合は登録できない' do
        @trading_information.phone_number = '111122223333'
        @trading_information.valid?
        expect(@trading_information.errors.full_messages).to include('Phone number is invalid')
      end

      it '⑩電話番号がにハイフンがある場合は登録できない' do
        @trading_information.phone_number = '03-111-111'
        @trading_information.valid?
        expect(@trading_information.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
