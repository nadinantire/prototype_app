FactoryBot.define do
  factory :order do
    parts { 'bolt' }
    equipment { 'engine' }
    numeral { 'test-01' }
    identification { 'sample-00' }
    quantity { '1' }
    remarks { '後納' }
    association :purchase
  end

  factory :second_order, class: Order do
    parts { 'nut' }
    equipment { 'purifire' }
    numeral { '0001' }
    identification { '#1000' }
    quantity { '3個' }
    remarks { '別途' }
    association :second_purchase
    end
  end