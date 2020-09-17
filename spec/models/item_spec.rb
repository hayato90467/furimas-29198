require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
  end

  describe '商品出品が上手くいく' do
    context '商品出品が上手くいく' do
      it 'user_idとimage、nameとname_description、name_category_id、
        name_condition_id、send_burden_id、send_day_id、send_area_id、price、入力をすれば登録できる.' do
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
      it 'カテゴリーが1だと登録できない' do
        @item.name_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Name category must be other than 1')
      end
      it '配送料の負担が空だと登録できない' do
        @item.send_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Send burden can't be blank")
      end
      it '配送料の負担が1登録できない' do
        @item.send_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Send burden must be other than 1')
      end
      it '商品の状態が空だと登録できない' do
        @item.name_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name condition can't be blank")
      end
      it '商品の状態が1だと登録できない' do
        @item.name_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Name condition must be other than 1')
      end
      it '発送までの日数が空だと登録できない' do
        @item.send_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end
      it '発送までの日数が1だと登録できない' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Send day must be other than 1')
      end
      it '発送元の地域が空だと登録できない' do
        @item.send_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Send area can't be blank")
      end
      it '発送元の地域が1だと登録できない' do
        @item.send_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Send area must be other than 1')
      end
      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は半角数字のみであること' do
        @item.price = 'アイウエオ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが299円未満では保存できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが10,000,000円を超過すると保存できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
