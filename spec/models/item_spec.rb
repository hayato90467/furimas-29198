require 'rails_helper'
describe Item do
  before do
    @user = FactoryBot.build(:item)
  end

  describe '商品出品が上手くいく' do
    context '商品出品が上手くいく' do
      it 'user_idとimage、nameとname_description、name_category_id、
          name_condition_id、send_burden_id、send_day_id、send_area_id、price、入力をすれば登録できる.'do
        expect(@item).to be_valid

      end
    end

    # context '商品出品がうまくいかないとき' do
    #   it '商品画像が空では登録できない' do
    #     @user.image = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Email can't be blank")
    #   end
    #   it '商品名が空だと登録できない' do
    #     @user.name = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Nickname can't be blank")
    #   end
    #   it '商品の説明が空だと登録できない' do
    #     @user.name_description = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password can't be blank")
    #   end
    #   it 'カテゴリーが空だと登録できない' do
    #     @name_category_id = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    #   end
    #   it '配送料の負担が空だと登録できない' do
    #     @user.send_burden_id = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name can't be blank")
    #   end
    #   it '商品の状態が空だと登録できない' do
    #     @user.name_condition_id = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Family name can't be blank")
    #   end
    #    it '発送までの日数が空だと登録できない' do
      #     @user.send_day_id = ''
      #     @user.valid?
      #     expect(@user.errors.full_messages).to include("Date can't be blank")
      #   end
    #   it '発送元の地域が空だと登録できない' do
    #     @user.send_area_id = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Date can't be blank")
    #   end
          # it '価格が空だと登録できない' do
      #     @user.price = ''
      #     @user.valid?
      #     expect(@user.errors.full_messages).to include("Date can't be blank")
    #   it '販売価格は半角数字のみであること' do
    #     @user.price = '１２３４５６７'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password is invalid')
    #   end
    #   it '価格の範囲が、¥300~¥9,999,999の間で入力させること' do
    #     @user.price = '1234556'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Family name is invalid')
    #   end
   
  end
end
