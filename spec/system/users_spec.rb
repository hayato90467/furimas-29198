require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  contex   '登録について'
  it 'ログインしていないユーザーは購入ページに遷移しようとすると、ログインページに遷移すること'do
  visit /items/new
  end
  it '出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移すること' do
    visit root_path
  end

  it 'URLを直接入力して購入済み商品の購入ページへ遷移しようとすると、トップページに遷移すること' do
    viset root_path
  end
end
