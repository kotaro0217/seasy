require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "birthが空では登録できないこと" do
      @user.bieth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

    it "passwordが半角英数混合(半角英語のみ)" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_,messages).to include("Password Include both letters and numbers") 

    end
  end
end