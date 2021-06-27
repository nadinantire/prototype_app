User.create!(
    email: "admin@sample.com",
    password: "123123",
    password_confirmation: "123123",
    admin: true
)

User.create!(
    email: "test@sample.com",
    password: "123123",
    password_confirmation: "123123",
    admin: true
)

User.create!(
  email: "testes@sample.com",
  password: "123123",
  password_confirmation: "123123",
  admin: true
)

User.create!(
  email: "ooo@sample.com",
  password: "123123",
  password_confirmation: "123123",
  admin: true
)

User.create!(
  email: "hihi@sample.com",
  password: "123123",
  password_confirmation: "123123",
  admin: true
)

Purchase.create!(
  firm: "A社",
  department: "総務部",
  position: "主任",
  name: "テスト太郎",
  acceptance_on: "2020-04-01",
  delivery: "5日",
  title: "4月分",
  user_id: 1
  )

Purchase.create!(
  firm: "B社",
  department: "総務部",
  position: "主任",
  name: "総務太郎",
  acceptance_on: "2020-05-01",
  delivery: "3日",
  title: "追加分",
  user_id: 2
  )

Purchase.create!(
  firm: "C社",
  department: "工務部",
  position: "工務部員",
  name: "工務太郎",
  acceptance_on: "2020-06-01",
  delivery: "1日",
  title: "至急",
  user_id: 3
  )

Purchase.create!(
  firm: "D社",
  department: "人事部",
  name: "人事吾郎",
  acceptance_on: "2020-07-01",
  delivery: "7日",
  title: "雑用",
  user_id: 4
  )

Purchase.create!(
  firm: "E社",
  department: "工務部",
  position: "部員",
  name: "工務一佐",
  acceptance_on: "2020-08-01",
  delivery: "10日",
  title: "予備品",
  user_id: 5
  )

Purchase.all.each do |purchase|
  purchase.orders.create!(
    parts: "ボルト",
    equipment: "エンジン",
    numeral: "sample01",
    identification: "sample02",
    quantity: "10本",
    remarks: "sus",
    purchase_id: 1
    )
end

Purchase.all.each do |purchase|
  purchase.orders.create!(
    parts: "パッキン",
    equipment: "発電機",
    numeral: "D/G01",
    identification: "D-2",
    quantity: "3枚",
    purchase_id: 2
    )
end

Purchase.all.each do |purchase|
  purchase.orders.create!(
    parts: "oリング",
    equipment: "濾過器",
    numeral: "m-01",
    identification: "no.4",
    quantity: "3本",
    remarks: "予備",
    purchase_id: 3
    )
end

Purchase.all.each do |purchase|
  purchase.orders.create!(
    parts: "ギア",
    equipment: "ポンプ",
    numeral: "test01",
    identification: "test02",
    quantity: "5個",
    remarks: "水用",
    purchase_id: 4
    )
end

Purchase.all.each do |purchase|
  purchase.orders.create!(
    parts: "フィルター",
    equipment: "ボイラー",
    numeral: "v-05",
    identification: "v-11",
    quantity: "2枚",
    remarks: "ウェット",
    purchase_id: 5
    )
end

  OrderConfirmation.create!(
    firm: "（株）海山会社",
    department: "海務部",
    position: "主任",
    name: "サンプル",
    acceptance_on: "2020-02-01",
    purchase_id: 1,
    title: "サンプル",
    user_id: 1
    )

OrderConfirmation.create!(
  firm: "test(株)",
  department: "総務部",
  position: "主任",
  name: "テスト太郎",
  acceptance_on: "2020-07-01",
  purchase_id: 2,
  title: "サンプル",
  user_id: 2
  )

OrderConfirmation.create!(
  firm: "テスト(株)",
  department: "人事部",
  position: "課長",
  name: "テステス",
  acceptance_on: "2020-09-01",
  purchase_id: 3,
  title: "追加",
  user_id: 3
  )

OrderConfirmation.create!(
  firm: "(株)",
  department: "庶務部",
  position: "係長",
  name: "赤川",
  acceptance_on: "2020-11-01",
  purchase_id: 4,
  title: "今月分",
  user_id: 4
  )

OrderConfirmation.create!(
  firm: "ABC",
  department: "営業部",
  position: "管理者",
  name: "次郎",
  acceptance_on: "2021-07-01",
  purchase_id: 5,
  title: "7月分",
  user_id: 5
  )

OrderConfirmation.all.each do |order|
  order.contractors.create!(
    price: 1500,
    tax: 150,
    total: 1650,
    due_on: "2020-02-05",
    order_confirmation_id: 1
    )
end

OrderConfirmation.all.each do |order|
  order.contractors.create!(
    price: 200,
    tax: 20,
    total: 220,
    due_on: "2020-07-05",
    order_confirmation_id: 2
    )
end

OrderConfirmation.all.each do |order|
  order.contractors.create!(
    price: 5200,
    tax: 520,
    total: 5720,
    due_on: "2020-10-05",
    order_confirmation_id: 3
    )
end

OrderConfirmation.all.each do |order|
  order.contractors.create!(
    price: 100,
    tax: 10,
    total: 110,
    due_on: "2020-12-05",
    order_confirmation_id: 4
    )
end

OrderConfirmation.all.each do |order|
  order.contractors.create!(
    price: 990,
    tax: 90,
    total: 900,
    due_on: "2021-08-05",
    order_confirmation_id: 5
    )
end