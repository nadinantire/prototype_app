require 'rails_helper'
RSpec.describe 'ユーザ登録テスト', type: :system do
  # let!(:user3) { FactoryBot.create(:user3) }
  let!(:user2) { FactoryBot.create(:user2) }

  before do
  visit tops_index_path
  end

  describe 'ユーザ登録のテスト' do
    context '新規登録した場合' do
      it 'ユーザの新規登録ができる' do
        click_on "新規登録"
        visit new_user_registration_path
        fill_in 'user[email]', with: 'san00@dic.com'
        fill_in 'user[password]', with: '321321'
        fill_in 'user[password_confirmation]', with: '321321'
        click_button 'commit'
        visit purchases_path
      end
    end
  end

  context 'ログインせずタスク一覧画面に飛ぼうとした場合' do
    it 'ログイン画面に遷移する' do
      visit purchases_path
      expect(page).to have_content 'ログイン'
    end
  end

  context 'ログアウトしようとした場合' do
    it 'ログアウトできる' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'sample@dic.com'
      fill_in 'user[password]', with: '321321'
      click_button 'commit'
      click_on 'ログアウト'
      expect(page).to have_content 'ログイン'
    end
  end
end