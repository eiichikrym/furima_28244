require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録成功' do
      it '①nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      context '新規登録失敗' do
        it '②nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it '③emailが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it '④重複したemailが存在すると登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it '⑤emailに@が無い場合は登録できない' do
          @user.email = 'test.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it '⑥passwordが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is too short (minimum is 6 characters)', 'Password is invalid')
        end
        it '⑦passwordが5文字以下であれば登録できない' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password is invalid')
        end
        it '⑧passwordは半角英数字混合でなければ登録できない' do
          @user.password = '1234512345'
          @user.password_confirmation = '1234512345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it '⑨passwordが存在してもpassword_confirmationが空の場合は登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
        end
        it '⑩ユーザー本名の名字が空だと登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
        end
        it '⑪ユーザー本名の名前が空だと登録できない' do
          @user.first_name = ''
          @user.valid?
        end
        it "⑫\bユーザー本名の名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
          @user.last_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end
        it '⑬ユーザー本名の名前は（漢字・ひらがな・カタカナ）でなければ登録できない' do
          @user.first_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end
        it '⑭ユーザー本名の名字のフリガナが空だと登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid')
        end
        it '⑮ユーザー本名の名前のフリガナが空だと登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
        end
        it '⑯ユーザー本名のフリガナは全角（カタカナ）でなければ登録できない' do
          @user.last_name_kana = 'ﾃｽﾄ'
          @user.first_name_kana = 'ﾃｽﾄ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana is invalid', 'First name kana is invalid')
        end
        it '⑰生年月日が空だと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
