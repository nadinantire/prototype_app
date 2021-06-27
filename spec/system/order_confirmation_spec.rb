require 'rails_helper'
RSpec.describe '受注機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:order_confirmation) { FactoryBot.create(:order_confirmation, purchase: purchase, user: user) }
  let!(:cotractor) { FactoryBot.create(:contractor, order_confirmation: order_confirmation) }
  let!(:purchase) { FactoryBot.create(:purchase, user: user) }


before do
  visit tops_index_path
  visit new_user_session_path
  fill_in "user[email]", with: 'test@dic.com'
  fill_in 'user[password]', with: '123123'
  click_button 'commit'
  visit purchases_path
  click_on FactoryBot.build(:purchase).title

end

  describe '新規作成機能' do
    context '発注を新規作成した場合' do
      it '作成した発注が表示される' do
      click_link "受注"
      click_on "追加"
      fill_in 'order_confirmation[acceptance_on]', with: '002021-08-01'
      fill_in 'order_confirmation[firm]', with: 'firm'
      fill_in 'order_confirmation[department]', with: 'dept'
      fill_in 'order_confirmation[position]', with: 'post'
      fill_in 'order_confirmation[name]', with: 'name'
      fill_in 'order_confirmation[title]', with: 'title'
      fill_in 'order_confirmation[contractors_attributes][0][price]', with: '1000'
      fill_in 'order_confirmation[contractors_attributes][0][tax]', with: '100'
      fill_in 'order_confirmation[contractors_attributes][0][total]', with: '1100'
      fill_in 'order_confirmation[contractors_attributes][0][due_on]', with: '一週間'
      click_on 'commit'
      end
    end
  end

  context '任意のタイトルをクリックした場合' do
    it 'show画面へ遷移される' do
      click_link "受注一覧"
      click_link '7月分'
    expect(page).to have_content '部品名'
    end
  end

  context '一覧画面に遷移した場合' do
    it '作成済みの一覧が表示される' do
      click_link "受注一覧"
      expect(page).to have_content FactoryBot.build(:order_confirmation).title
    end
  end
end