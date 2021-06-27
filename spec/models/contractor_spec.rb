require 'rails_helper'

describe 'contractor modelテスト', type: :model do
  describe 'バリデーションのテスト' do
    let!(:order_confirmation) { FactoryBot.create(:contractor) }
    let!(:order_confirmation) { FactoryBot.create(:order_confirmation, user: user, purchase: purchase) }
    let!(:user) { FactoryBot.create(:user3)}
    let!(:purchase) { FactoryBot.create(:purchase) }

    context '入力フォームが空の場合' do
      it 'バリデーションにひっかかる' do
        contractor = Contractor.new(nil)
        expect(contractor).not_to be_valid
      end
    end
    context '価格に内容が記載されている場合' do
      it 'バリデーションが通る' do
        contractor = Contractor.new(price: '1000',tax: '100', total: '200', due_on: '2021-07-07', order_confirmation: order_confirmation)
        expect(contractor).to be_valid
      end
    end
  end
end