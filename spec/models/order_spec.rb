require 'rails_helper'

describe 'order modelテスト', type: :model do
  describe 'バリデーションのテスト' do
    let!(:purchase) { FactoryBot.create(:purchase) }
    context 'タイトルが空の場合' do
      it 'バリデーションにひっかかる' do
        order = Order.new(nil)
        expect(order).not_to be_valid
      end
    end
    context 'タイトルに内容が記載されている場合' do
      it 'バリデーションが通る' do
        order = Order.new(parts: 'good', equipment: 'good', quantity: '1', purchase_id: purchase.id )
        expect(order).to be_valid
      end
    end
  end
end