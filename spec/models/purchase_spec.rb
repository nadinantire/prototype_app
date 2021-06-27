require 'rails_helper'

describe 'purchase modelテスト', type: :model do
  describe 'バリデーションのテスト' do
    let!(:user) { FactoryBot.create(:user2)}
    let!(:purchase) { FactoryBot.create(:purchase) }
    context 'タイトルが空の場合' do
      it 'バリデーションにひっかかる' do
        purchase = Purchase.new(nil)
        expect(purchase).not_to be_valid
      end
    end
    context 'タイトルに内容が記載されている場合' do
      it 'バリデーションが通る' do
        purchase = Purchase.new(title:'成功', firm: '成功', department: '成功', name: '成功', acceptance_on: '2021-07-10', delivery: '2日', user_id: user.id)
        expect(purchase).to be_valid
      end
    end
  end
end