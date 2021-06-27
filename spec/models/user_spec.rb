require 'rails_helper'

describe 'user modelテスト', type: :model do
  describe 'バリデーションのテスト' do
    let!(:user) { FactoryBot.create(:user4)}
    context 'Eメールが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(email: nil)
        expect(user).not_to be_valid
      end
    end
    context 'Emailに内容が記載されている場合' do
      it 'バリデーションが通る' do
        user = User.new(email: 'test@email.com', password: '123123')
        expect(user).to be_valid
      end
    end
  end
end