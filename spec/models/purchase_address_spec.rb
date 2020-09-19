require 'rails_helper'
describe PurchaseAddress do
  before do    
    @purchase_addresses = FactoryBot.build(:purchase_address)
  end

  describe 'クレジット購入' do
    context 'クレジット購入がうまく行く時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_addresses).to be_valid
      end
    end

    context 'クレジット購入がうまくいかない時' do
     it 'クレジットカード情報が正しくないと保存できないこと' do
      @purchase_addresses.token = nil
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Token can't be blank")
     end
     it '郵便番号がないと保存できないこと' do
      @purchase_addresses.post = nil
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Post can't be blank")
     end
     it '郵便番号にがハイフンないと保存できないこと' do
      @purchase_addresses.post= "3123342"
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Post is invalid. Include hyphen(-)")
     end
     it '郵便番号が７桁でないと保存できないこと' do
      @purchase_addresses.post= "12-2345"
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Post is invalid. Include hyphen(-)")
     end
     it '都道府県を選択していないと保存できないこと' do
      @purchase_addresses.prefectures_id = 0
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Prefectures can't be blank")
     end
     it '市区町村が空だと保存できないこと' do
      @purchase_addresses.city = ''
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("City can't be blank")
     end
     it '番地が空でだと保存できないこと' do
      @purchase_addresses.building  = ""
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Building can't be blank")
     end
     it '電話番号が空だと保存できないこと' do
      @purchase_addresses.mobile= nil
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Mobile can't be blank")
     end
     it '電話番号ハイフン不要で11桁内でないとと保存できないこと' do
      @purchase_addresses.mobile = '000-3111-046'
      @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Mobile is invalid")
     end
      it 'tokenがないと保存できない' do
        @purchase_addresses.token = ""
        @purchase_addresses.valid?
      expect(@purchase_addresses.errors.full_messages).to include("Token can't be blank")
     end
    end
  end
end
 