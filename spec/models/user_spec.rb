require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context 'ユーザー新規登録ができる時' do
    it 'nicknameとemail、passwordとpassword(確認用)、苗字と苗字(カナ)、名前と名前(カナ)、生年月日が存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'emailは@を含み一意性があれば登録できる' do
      @user.email = 'abc@com'
      expect(@user).to be_valid
    end

    it 'passwordは英数字を含んだ6文字以上であれば登録できる' do
      @user.password = '00a00b0'
      expect(@user).to be_valid
    end

    it 'password(確認用)はpasswordはと一致していれば登録できる' do
      @user.password = '00a00b0'
      expect(@user).to be_valid
    end

    it '苗字は全角(漢字・平仮名・カナ)であれば登録できる' do
      @user.last_name = '阿部あべ'
      expect(@user).to be_valid
    end

    it '名前は全角(漢字・平仮名・カナ)であれば登録できる' do
      @user.first_name = '阿部あべ'
      expect(@user).to be_valid
    end

    it '苗字(フリガナ)は全角カナであれば登録できる' do
      @user.last_name = 'アベアベ'
      expect(@user).to be_valid
    end

    it '名前(フリガナ)は角カナであれば登録できる' do
      @user.first_name_kana  = 'アベアベ'
      expect(@user).to be_valid
    end

    it '生年月日は入力があれば登録できる' do
      @user.birthday  = '2000-01-02'
      expect(@user).to be_valid
    end
   end


   context 'ユーザー新規登録ができない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailは重複すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailは@がないと登録できない' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordは空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは6文字未満だと登録できない' do
      @user.password = 'zaq12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordは半角数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it 'passwordは半角英字のみでは登録できない' do
      @user.password = 'zaqwsx'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it 'passwordは全角文字では登録できない' do
      @user.password = '１ｉｕｅｏ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it 'passwordは確認用を入力していないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword(確認用)は一致していないと登録できない' do
      @user.password_confirmation = '010101'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '苗字が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
   
    it '名前が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '苗字が全角(漢字・平仮名・カナ)でないと登録できない' do
      @user.last_name = 'abe'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
    end

    it '名前が全角(漢字・平仮名・カナ)でないと登録できない' do
      @user.first_name  = 'abe'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
    end

    it '苗字(フリガナ)が空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '名前(フリガナ)が空では登録できない' do
      @user.first_name_kana  = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '苗字(フリガナ)が全角カナでないと登録できない' do
      @user.last_name_kana = 'あべ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
    end

    it '名前(フリガナ)が全角カナでないと登録できない' do
      @user.first_name_kana  = 'あべ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
    end

    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   end
  end
end
