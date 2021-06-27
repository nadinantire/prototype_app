require 'rails_helper'
RSpec.describe '発注機能', type: :system do
  let!(:purchase) { FactoryBot.create(:purchase) }
  let!(:order) { FactoryBot.create(:order, purchase: purchase) }

before do
  visit tops_index_path
  click_on "新規登録"
  visit new_user_session_path
  fill_in "user[email]", with: 'test@dic.com'
  fill_in 'user[password]', with: '123123'
  click_button 'commit'
  visit purchases_path
end

describe '新規作成機能' do
  context '発注を新規作成した場合' do
    it '作成した発注が表示される' do
      visit new_purchase_path
      fill_in 'purchase[acceptance_on]', with: '002021-08-01'
      fill_in 'purchase[firm]', with: 'firm'
      fill_in 'purchase[department]', with: 'dept'
      fill_in 'purchase[position]', with: 'post'
      fill_in 'purchase[name]', with: 'name'
      fill_in 'purchase[delivery]', with: 'deli'
      fill_in 'purchase[title]', with: 'title'
      fill_in 'purchase[orders_attributes][0][parts]', with: 'parts'
      fill_in 'purchase[orders_attributes][0][equipment]', with: 'eq'
      fill_in 'purchase[orders_attributes][0][numeral]', with: 'sample'
      fill_in 'purchase[orders_attributes][0][identification]', with: 'sample'
      fill_in 'purchase[orders_attributes][0][quantity]', with: '1'
      fill_in 'purchase[orders_attributes][0][remarks]', with: 'aaa'
      click_on 'commit'
    end
  end
end

  context '任意のタイトルをクリックした場合' do
    it 'show画面へ遷移される' do
      click_link '7月分'
      visit purchase_path(purchase.id)
    end
  end

  context '一覧画面に遷移した場合' do
    it '作成済みの一覧が表示される' do
      expect(page).to have_content FactoryBot.build(:purchase).title
    end
  end

  context '検索をした場合' do
    it '部品で検索でき、タイトルで表示できる' do
      fill_in 'q[orders_parts_or_orders_equipment_or_orders_numeral_or_orders_identification_cont]', with: 'bolt'
      click_button 'commit'
      expect(page).to have_content FactoryBot.build(:purchase).title
    end
  end

  context '検索をした場合' do
    it '機器名で検索でき、日付で表示できる' do
      fill_in 'q[orders_parts_or_orders_equipment_or_orders_numeral_or_orders_identification_cont]', with: 'engine'
      click_button 'commit'
      expect(page).to have_content FactoryBot.build(:purchase).acceptance_on
    end
  end
end
