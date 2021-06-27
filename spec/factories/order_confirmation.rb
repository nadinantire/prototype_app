FactoryBot.define do
  factory :order_confirmation do
    firm { 'A社' }
    department { '工務部' }
    position { '工務監督' }
    name { '工務太郎' }
    acceptance_on { '2021-07-05' }
    title { '7月分' }
    # association :user, factory: :user3
    # association :purchase, factory: :purchase2
    # user { purchase.user}
  end

  factory :system_order_confirmation, class: OrderConfirmation do
    firm { 'B社' }
    department { '海務部' }
    position { '海務監督' }
    name { '海務次郎' }
    acceptance_on { '2021-07-07' }
    title { '7月分追加' }
    # association :user, factory: :fourth_user
    # association :purchase, factory: :second_purchase
    end
  end