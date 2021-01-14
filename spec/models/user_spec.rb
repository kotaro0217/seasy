require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'ニックネームとメールアドレス、パスワードとパスワード（確認用）が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end

      it '重複したメールアドレスが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end

      it 'メールアドレスには@がなければ登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'パスワードは半角英数字混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'bbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード半角英数を使用してください')
      end

      it 'パスワードが5文字以下であれば登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'パスワードが存在してもパスワード（確認用）が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'パスワードとパスワード（確認用）、値の一致していなければ登録できない' do
        @user.password = '000bbb'
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it '生年月日が空では登録できないこと' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end

      it '名前がなければ保存できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前全角文字を使用してください')
      end

      it '名字がなければ保存できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字全角文字を使用してください')
      end

      it '名前のフリガナがなければ保存できない' do
        @user.read_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(フリガナ)カタカナを使用してください')
      end

      it '名字のフリガナがなければ保存できない' do
        @user.read_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(フリガナ)カタカナを使用してください')
      end

      it '名前が全角かなでなければ保存できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前全角文字を使用してください')
      end

      it '名字が全角かなでなければ保存できない' do
        @user.family_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字全角文字を使用してください')
      end

      it '名前が全角カナでなければ保存できない' do
        @user.read_first_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(フリガナ)カタカナを使用してください')
      end

      it '名字が全角カナでなければ保存できない' do
        @user.read_family_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(フリガナ)カタカナを使用してください')
      end
    end
  end
end
