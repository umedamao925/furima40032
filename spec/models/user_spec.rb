require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '正常に登録できる' do
        expect(@user).to be_valid
      end

        it 'nicknameを入力すると登録できる' do
          @user.nickname = 'aaa'
          expect(@user).to be_valid
        end
    
        it 'emailを入力すると登録できる' do
          @user.email = 'test@example'
          expect(@user).to be_valid
        end
    
        it 'passwordを入力すると登録できる' do
          @user.password = '00000a'
          @user.password_confirmation = '00000a'
          expect(@user).to be_valid
        end
    
        it 'password_confirmationを入力すると登録できる' do
          @user.password = '00000a'
          @user.password_confirmation = '00000a'
          expect(@user).to be_valid
        end
    
        it 'last_nameを入力すると登録できる' do
          @user.last_name = '田中'
          expect(@user).to be_valid
        end
    
        it 'first_nameを入力すると登録できる' do
          @user.first_name = '花子'
          expect(@user).to be_valid
        end
    
        it 'last_name_kanaを入力すると登録できる' do
          @user.last_name_kana = 'タナカ'
          expect(@user).to be_valid
        end
    
        it 'first_name_kanaを入力すると登録できる' do
          @user.first_name_kana = 'ハナコ'
          expect(@user).to be_valid
        end
    
        it 'birth_dayを入力すると登録できる' do
          @user.birth_day = '2024-02-03'
          expect(@user).to be_valid
        end
    
        it 'emailは@を入力すると登録できる' do
          @user.email = 'test@email'
          expect(@user).to be_valid
        end
    
        it 'passwordを5文字以上入力すると登録できる' do
          @user.password = '00000a'
          @user.password_confirmation = '00000a'
          expect(@user).to be_valid
        end
    
        it 'passwordは英数字があると登録できる' do
          @user.password = '00000a'
          @user.password_confirmation = '00000a'
          @user.valid?
        end

        it 'passwordとconfirmが一致していると登録できる' do
          @user.password = 'test123'
          @user.password_confirmation ='test123'
          expect(@user).to be_valid
        end

      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user).to be_valid
      end

      it 'first_nameとlast_nameが全角であれば登録できる' do
        @user.first_name = '田中'
        @user.last_name = '花子'
        expect(@user).to be_valid
      end
      it 'first_name_kanaとlast_name_kanaが全角であれば登録できる' do
        @user.first_name_kana = 'タナカ'
        @user.last_name_kana = 'ハナコ'
        expect(@user).to be_valid
      end
    end

  context '新規登録出来ない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Emailを入力してください")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordを入力してください")
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last nameを入力してください")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First nameを入力してください")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanaを入力してください")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanaを入力してください")
    end

    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth dayを入力してください")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Emailはすでに存在します')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Emailは不正な値です')
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '0000a'
      @user.password_confirmation = '0000a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordは6文字以上で入力してください')
    end

    it 'passwordに全角文字を含むと登録できない' do
      @user.password = 'あ0000a'
      @user.password_confirmation = 'あ0000a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordは半角英数を両方含む必要があります。')
    end

    it 'passwordは英字がないと登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordは半角英数を両方含む必要があります。')
    end

    it 'passwordは数字がないと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordは半角英数を両方含む必要があります。')
    end

    it 'passwordとconfirmが一致していないと登録できない' do
      @user.password = 'test123'
      @user.password_confirmation ='test1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
    end

    it 'last_name_kanaが半角では登録できない' do
      @user.first_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanaはカタカナで入力して下さい。")
    end

    it 'first_name_kanaが半角では登録できない' do
      @user.last_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanaはカタカナで入力して下さい。")
    end

    it 'first_nameが半角では登録できない' do
      @user.first_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First nameは全角で入力して下さい。")
    end

    it 'last_nameが半角では登録できない' do
      @user.last_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last nameは全角で入力して下さい。")
    end
end
end
end