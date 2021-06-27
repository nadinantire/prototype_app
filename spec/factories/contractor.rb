FactoryBot.define do
  factory :contractor do
    price { '100' }
    tax { '10' }
    total { '110' }
    due_on { '2021-07-01' }
    association :order_confirmation
  end

  factory :second_contractor, class: Contractor do
    price { '500' }
    tax { '50' }
    total { '550' }
    due_on { '2021-08-01' }
    association :second_order_confirmation
  end
end