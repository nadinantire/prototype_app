FactoryBot.define do
  factory :user do
    email { "test@dic.com" }
    password { "123123" }
    password_confirmation { '123123' }
    admin { true }
  end

  factory :user2, class: User do
    email { "sample@dic.com" }
    password { "321321" }
    password_confirmation { '321321' }
    admin { true }
  end

  factory :user3, class: User do
    email { "san00@dic.com" }
    password { "321321" }
    password_confirmation { '321321' }
    admin { true }
  end

  factory :user4, class: User do
    email { "sampleeee@dic.com" }
    password { "321321" }
    password_confirmation { '321321' }
    admin { true }
  end
end
