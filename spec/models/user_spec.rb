require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全ての項目が正しく存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank") 
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'xxx12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordが全角で入力されている場合は登録できない' do
        @user.password = 'ｘｘｘ１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it 'first_name_kanaがカタカナ以外では登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
    end
  end

end
