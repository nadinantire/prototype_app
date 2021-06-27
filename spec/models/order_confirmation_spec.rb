require 'rails_helper'

describe 'modelテスト', type: :model do
  describe 'バリデーションのテスト' do
    let!(:user) { FactoryBot.create(:user2)}
    let!(:purchase) { FactoryBot.create(:purchase) }
    let!(:order_confirmation) { FactoryBot.create(:order_confirmation, user: user, purchase: purchase) }
    context 'タイトルが空の場合' do
      it 'バリデーションにひっかかる' do
        order = order_confirmation.title = nil
        expect(order_confirmation).not_to be_valid
      end
    end
    context 'タイトルに内容が記載されている場合' do
      it 'バリデーションが通る' do
        order = order_confirmation.title = '成功'
        expect(order_confirmation).to be_valid
      end
    end
  end
end