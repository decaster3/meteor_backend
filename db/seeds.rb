# frozen_string_literal: true
if City.all.size == 0
  Country.create!([
                      {name: 'Казахстан'},
                      {name: 'Киргизстан'}
                  ])
  City.create!([
                   {name: 'Алматы', schedule: '[
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("6:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("3:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("3:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("6:00", "HH:mm")}]', country_id: 1, currency: 'тенге', phone: '+79870432112', google_key: 'Almaty'},
                   {name: 'Бишкек', schedule: '[
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
    ]', country_id: 2, currency: 'сом', phone: '+79870432112', google_key: 'Bishkek'},
                   {name: 'Астана', schedule: '[
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
      {
        opensAt: moment("07:00", "HH:mm"),
        closesAt: moment("03:00", "HH:mm"),
      },
    ]', country_id: 1, currency: 'тенге', phone: '+79870432112', google_key: 'Astana'}
               ])
  Category.create!([
                       {name: 'Пицца'},
                       {name: 'Бургеры'},
                       {name: 'Суши'},
                       {name: 'Закуски'},
                       {name: 'Напитки'},
                       {name: "Сеты"}
                   ])
  Subcategory.create!(name: 'ololo', category_id: 1)
  OptionName.create!([
                         {name: 'размер', category_id: 1, is_characteristic: false},
                         {name: 'тесто', category_id: 1, is_characteristic: false},
                         {name: 'вес', category_id: 1, is_characteristic: true}
                     ])
  Product.create!([
                      {name: 'Маргарита', description: 'Пицца Маргарита, сделанная из томатов Сан Марино, сыра моцарелла, свежого базилика.', category_id: 1, is_topping: false},
                      {name: 'Гавайская', description: 'Гавайская пицца из сыра, томатов, курицы и ананасов.', category_id: 1, is_topping: false}
                  ])
  Product.first.subcategories << Subcategory.first
  ProductInstance.create!([
                              {product_id: 1, barcode: '2100000000272'},
                              {product_id: 1, barcode: '2100000000258'},
                              {product_id: 1, barcode: '2100000000241'},
                              {product_id: 1, barcode: '2100000000265'},
                              {product_id: 1, barcode: '2100000000289'},
                              {product_id: 1, barcode: '2100000000296'},
                              {product_id: 2, barcode: '2100000000302'},
                              {product_id: 2, barcode: '2100000000319'},
                              {product_id: 2, barcode: '2100000000326'},
                              {product_id: 2, barcode: '2100000000333'},
                              {product_id: 2, barcode: '2100000000340'},
                              {product_id: 2, barcode: '2100000000357'}
                          ])
  OptionValue.create!([
                          {value: '28 см', option_name_id: 1},
                          {value: '38 см', option_name_id: 1},
                          {value: '42 см', option_name_id: 1},
                          {value: 'тонкое', option_name_id: 2},
                          {value: 'толстое', option_name_id: 2},
                          {value: '750 г', option_name_id: 3},
                          {value: '650 г', option_name_id: 3},
                          {value: '550 г', option_name_id: 3},
                          {value: '850 г', option_name_id: 3},
                          {value: '750 г', option_name_id: 3},
                          {value: '650 г', option_name_id: 3},
                          {value: '785 г', option_name_id: 3},
                          {value: '685 г', option_name_id: 3},
                          {value: '585 г', option_name_id: 3},
                          {value: '885 г', option_name_id: 3},
                          {value: '785 г', option_name_id: 3},
                          {value: '685 г', option_name_id: 3}
                      ])
  City.find(1).products << Product.find(1)
  City.find(2).products << Product.find(1)
  City.find(1).products << Product.find(2)
  Price.create!([
                    {value: '255', city_id: 1, product_instance_id: 1},
                    {value: '200', city_id: 1, product_instance_id: 2},
                    {value: '188', city_id: 1, product_instance_id: 3},
                    {value: '188', city_id: 1, product_instance_id: 4},
                    {value: '200', city_id: 1, product_instance_id: 5},
                    {value: '255', city_id: 1, product_instance_id: 6},
                    {value: '285', city_id: 1, product_instance_id: 7},
                    {value: '230', city_id: 1, product_instance_id: 8},
                    {value: '218', city_id: 1, product_instance_id: 9},
                    {value: '218', city_id: 1, product_instance_id: 10},
                    {value: '230', city_id: 1, product_instance_id: 11},
                    {value: '285', city_id: 1, product_instance_id: 12}
                ])
  ProductOption.create!([
                            {product_instance_id: 1, option_value_id: 3},
                            {product_instance_id: 2, option_value_id: 2},
                            {product_instance_id: 3, option_value_id: 1},
                            {product_instance_id: 3, option_value_id: 5},
                            {product_instance_id: 2, option_value_id: 5},
                            {product_instance_id: 1, option_value_id: 5},
                            {product_instance_id: 4, option_value_id: 4},
                            {product_instance_id: 5, option_value_id: 4},
                            {product_instance_id: 6, option_value_id: 4},
                            {product_instance_id: 4, option_value_id: 1},
                            {product_instance_id: 5, option_value_id: 2},
                            {product_instance_id: 6, option_value_id: 3},
                            {product_instance_id: 6, option_value_id: 6},
                            {product_instance_id: 5, option_value_id: 7},
                            {product_instance_id: 4, option_value_id: 8},
                            {product_instance_id: 1, option_value_id: 9},
                            {product_instance_id: 2, option_value_id: 10},
                            {product_instance_id: 3, option_value_id: 11},

                            {product_instance_id: 7, option_value_id: 1},
                            {product_instance_id: 7, option_value_id: 4},
                            {product_instance_id: 7, option_value_id: 12},

                            {product_instance_id: 8, option_value_id: 2},
                            {product_instance_id: 8, option_value_id: 4},
                            {product_instance_id: 8, option_value_id: 13},

                            {product_instance_id: 9, option_value_id: 3},
                            {product_instance_id: 9, option_value_id: 4},
                            {product_instance_id: 9, option_value_id: 14},

                            {product_instance_id: 10, option_value_id: 1},
                            {product_instance_id: 10, option_value_id: 5},
                            {product_instance_id: 10, option_value_id: 15},

                            {product_instance_id: 11, option_value_id: 2},
                            {product_instance_id: 11, option_value_id: 5},
                            {product_instance_id: 11, option_value_id: 16},

                            {product_instance_id: 12, option_value_id: 3},
                            {product_instance_id: 12, option_value_id: 5},
                            {product_instance_id: 12, option_value_id: 17}

                        ])
  User.create!(name: 'Rinat', phone: '+79991571024', password: 'qweqweqwe')
  u = User.create!(name: 'Rinat', phone: '+79999999999', password: 'qweqweqwe')
  u.inviter = User.first
  u.save
  Address.create!([{street: "АЙТИЕВА", building: "28", apartment: "64", comment: "домофон есть", city_id: 1}])
  o = Order.new(payment_method: "cash", status: "not_adopted", amount: 855.0, meteors: 0, address_id: 1, delivery_time: "2018-03-27 00:23:42", user_id: 2)
  o.save!(validate: false)
  OrderProduct.create!([{quantity: 1, product_instance_id: 1, order_id: 1}, {quantity: 3, product_instance_id: 2, order_id: 1},])

  Address.create!([{street: "БАЛЬЗАКА", building: "15", apartment: "20", comment: "домофон есть", city_id: 1}])
  o = Order.new(payment_method: "cash", status: "not_adopted", amount: 855.0, meteors: 0, address_id: 2, delivery_time: "2018-03-27 00:23:42", user_id: 2)
  o.save!(validate: false)
  OrderProduct.create!([{quantity: 1, product_instance_id: 1, order_id: 2}, {quantity: 3, product_instance_id: 2, order_id: 2},])
else
  p "Seeds have been already seeded"
end
Street.all.each {|s| s.delete}
if Street.all.size == 0
  file=File.open("#{__dir__}/streets.txt", "r")
  file.each do |line|
    Street.create!(name: line.strip)
  end
  file.close
end
