FactoryBot.define do
  factory :purchase do
    firm { 'A社' }
    department { '工務部' }
    position { '工務監督' }
    name { '工務太郎' }
    acceptance_on { '2021-07-01' }
    delivery { '一週間' }
    title { '7月分' }
    association :user
end

  factory :purchase2, class: Purchase do
    firm { 'B社' }
    department { '海務部' }
    position { '海務監督' }
    name { '海務次郎' }
    acceptance_on { '2021-07-07' }
    delivery { '5日' }
    title { '7月分追加' }
    association :user, factory: :user3
  end

  factory :purchase3, class: Purchase do
    firm { 'C社' }
    department { '工務部' }
    position { '工務監督' }
    name { '日本一郎' }
    acceptance_on { '2021-07-10' }
    delivery { '10日' }
    title { '7月分追加' }
    parts { 'o-ring' }
    equipment { 'Diesel generator ' }
    numeral { 'e-0000' }
    identification { 'sample000' }
    quantity { '5個' }
    remarks { '前納' }
    # association :user, factory: :user
  end
end