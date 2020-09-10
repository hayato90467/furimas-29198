require 'rails_helper'
describe Item do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
  end

  describe '商品出品が上手くいく' do
    context '商品出品が上手くいく' do
      it 'user_idとimage、nameとname_description、name_category_id、
        name_condition_id、send_burden_id、send_day_id、send_area_id、price、入力をすれば登録できる.'do
        expect(@item).to be_valid
      end
     end
     context '商品出品がうまくいかないとき' do
       it '商品画像が空では登録できない' do
           @item.image = nil
           @item.valid?   
           expect(@item.errors.full_messages).to include("Image can't be blank")
       end
      it '商品名が空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
        it '商品の説明が空だと登録できない' do
          @item.name_description = nil
           @item.valid?
          expect(@item.errors.full_messages).to include("Name description can't be blank")
        end
       it 'カテゴリーが空だと登録できない' do
         @item.name_category_id = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("Name category can't be blank")
       end
       it '配送料の負担が空だと登録できない' do
         @item.send_burden_id = nil
         @item.valid?
         expect(@item.errors.full_messages).to include("Send burden can't be blank")
       end
        it '商品の状態が空だと登録できない' do
          @item.name_condition_id = nil
          @item.valid?
          
          expect(@item.errors.full_messages).to include("Name condition can't be blank")
        end
        it '発送までの日数が空だと登録できない' do
          @item.send_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Send day can't be blank")
        end
       it '発送元の地域が空だと登録できない' do
          @item.send_area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Send area can't be blank")
       end
          it '価格が空だと登録できない' do
             @item.price = ''
             @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
          end
         it '販売価格は半角数字のみであること' do
           @item.price = 'アイウエオ'
           @item.valid?
           binding.pry
           expect(@item.errors.full_messages).to include("Price is invalid")
        end
        it '価格の範囲が、¥300~¥9,999,999の間で入力させること' do
          @item.price = '1234556'
          @item.valid?
          expect(@user.errors.full_messages).to include('Family name is invalid')
        end
    end
  end
end