require 'rails_helper'
describe PurchaseAddress do
  before do
    @purchase_addresses = FactoryBot.build(:purchase_addresses)
  end

    describe 'クレジット購入' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_addresses).to be_valid
      binding.pry
    end
  end

    # it 'クレジットカードが正しくないと保存できないこと' do
    #   @purchase_addresses .name = nil
    #   @purchase_addresses .valid?
    #   expect(@user_donation.errors.full_messages).to include("Name can't be blank")
    # end
    # it '有効期限が空だと保存できないこと' do
    #   @purchase_addresses .name_reading = nil
    #   @purchase_addresses .valid?
    #   expect(@user_donation.errors.full_messages).to include("Name reading can't be blank")   
    # end
    # it '有効期限(月）が空だと保存できないこと' do
    #   @purchase_addresses .name_reading = nil
    #   @purchase_addresses .valid?
    #   expect(@user_donation.errors.full_messages).to include("Name reading can't be blank")
    # end
    # it 'セキュリティーコードが空だと保存できないこと' do
    #   @purchase_addresses .name_reading = nil
    #   @purchase_addresses .valid?
    #   expect(@user_donation.errors.full_messages).to include("Name reading can't be blank")
    # end
    context 'クレジット購入がうまくいかない時' do
     it '郵便番号がないと保存できないこと' do
      @purchase_addresses.post = nill
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Name reading is invalid. Input full-width katakana characters.")
     end
     it '郵便番号にがハイフンないと保存できないこと' do
      @purchase_addresses.post= "3123342"
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Name reading is invalid. Input full-width katakana characters.")
     end
     it '都道府県を選択していないと保存できないこと' do
      @purchase_addresses.prefectures_id = 0
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Prefecture can't be blank")
     end
     it '市区町村が空だと保存できないこと' do
      @purchase_addresses.city = ''
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Nickname can't be blank")
     end
     it '番地が空でないと保存できないこと' do
      @purchase_addresses.bilding = ""
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Nickname is invalid. Input half-width characters.")
     end
     it '電話番号が空だと保存できないこと' do
      @purchase_addresses.mobile= nil
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Postal code can't be blank")
     end
     it '電話番号ハイフン不要で１１桁内でないとと保存できないこと' do
      @purchase_addresses.mobile = '000-3111-046'
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
     end
      # it '都道府県を選択していないと保存できないこと' do
     #   @purchase_addresses.prefecture = 0
     #   @purchase_addresses.valid?
     #   expect(@purchase_addresses.errors.full_messages).to include("Prefecture can't be blank")
      # end
     # it 'cityは空でも保存できること' do
     #   @upurchase_addresses .city = nil
      #   expect(@user_donation).to be_valid
     # end
     it 'priceが空だと保存できないこと' do
      @purchase_addresses.price = nil
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Price can't be blank")
     end
     # it 'priceが全角数字だと保存できないこと' do
     #   @purchase_addresses.price = '２０００'
     #   @purchase_addresses.valid?
     #   expect(@purchase_addresses.errors.full_messages).to include("Price is invalid. Input half-width characters.")
     # end
   end
  end
end
 