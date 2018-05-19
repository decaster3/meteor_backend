City::HABTM_Products.create!([
  {product_id: 1, city_id: 1},
  {product_id: 2, city_id: 4},
  {product_id: 2, city_id: 1}
])
Product::HABTM_Cities.create!([
  {product_id: 1, city_id: 1},
  {product_id: 2, city_id: 4},
  {product_id: 2, city_id: 1}
])
User.create!([
  {email: "tiran678@icloud.com", encrypted_password: "$2a$11$8dxfHU8/13n8FkKStAmP2.RCzlB.oG1n3wNFY8mqGzG9Q2EfX0Y5G", phone: "89991571024", role: "client", jti: "6e52401f-efe8-4bcd-9b63-1d4d0c40e05d"},
  {email: "tiran123678@icloud.com", encrypted_password: "$2a$11$3qJ7ASJ97H8hdoeEnKW5sOpgqA6A1jhoADtDhQctEL.M1cByKJEU.", phone: "89991571124", role: "client", jti: "0d27d0a4-c0d1-46d5-9c90-e2ec1171bcb8"},
  {email: "tiran113678@icloud.com", encrypted_password: "$2a$11$N/d3Z7EpsEOJvs/MkN3Q9Ol2sHkB0X8m4jlYoyhZ8jkBtGuAIkUlm", phone: "89991575124", role: "client", jti: "e4193bf0-b345-4db2-a399-4086379928a7"},
  {email: "tes4567ht@test.test", encrypted_password: "$2a$11$iBLL.x7YmNYYjFQl5KD4Cep3.CghT8GDQV5vSD3ogyrH2qdFbNKbK", phone: "80001552040", role: "client", jti: "ecac2b97-dc06-462e-afc4-1e4cf20a16d8"},
  {email: "tes67ht@test.test", encrypted_password: "$2a$11$yZd1Ano4cB7BpDHqAn5N/e.qMEuP5Jh7vZMKJyjEia4hmsb6XzQHu", phone: "8000152040", role: "client", jti: "4d71a71b-eec3-4006-aa5d-4d52d62dce6a"}
])
Address.create!([
  {street: "Universitetskaya", building: "1/2", apartment: "2-336", comment: "guards", city_id: 1},
  {street: "Sportivnaya", building: "28", apartment: "64", comment: "домофон есть", city_id: 1}
])
Category.create!([
  {name: "pizza"},
  {name: "Sushi"},
  {name: "Burger"}
])
City.create!([
  {name: "Kazan", schedule: nil, country_id: 1, currency: nil, phone: nil},
  {name: "Kazan", schedule: {"opens_at"=>"8:00", "closes_at"=>"23:00"}, country_id: 1, currency: nil, phone: nil},
  {name: "Kazan", schedule: {"opens_at"=>"8:00"}, country_id: 1, currency: nil, phone: "0000000000"},
  {name: "Kazan", schedule: {"opens_at"=>"8:00", "closes_at"=>"23:00"}, country_id: 1, currency: nil, phone: "0000000000"}
])
Country.create!([
  {name: "Russia"}
])
OptionName.create!([
  {name: "quantity", category_id: 2, is_characteristic: nil},
  {name: "size", category_id: 1, is_characteristic: nil},
  {name: "dough", category_id: 1, is_characteristic: nil}
])
OptionValue.create!([
  {value: "28cm", option_name_id: 1},
  {value: "thin", option_name_id: 2},
  {value: "28cm", option_name_id: 1},
  {value: "thin", option_name_id: 2},
  {value: "28cm", option_name_id: 1},
  {value: "thin", option_name_id: 2},
  {value: "28cm", option_name_id: 1},
  {value: "thin", option_name_id: 2},
  {value: "28cm", option_name_id: 1},
  {value: "thin", option_name_id: 2},
  {value: "28cm", option_name_id: 1},
  {value: "thin", option_name_id: 2},
  {value: "28cm", option_name_id: 1},
  {value: "thin", option_name_id: 2},
  {value: "28cm", option_name_id: 1},
  {value: "thin", option_name_id: 2},
  {value: "28cm", option_name_id: 1},
  {value: "thin", option_name_id: 2}
])
Order.create!([
  {payment_method: nil, status: "not_adopted", address_id: 1, user_id: nil},
  {payment_method: nil, status: "not_adopted", address_id: 1, user_id: nil},
  {payment_method: nil, status: "not_adopted", address_id: 1, user_id: nil},
  {payment_method: nil, status: "not_adopted", address_id: 1, user_id: nil},
  {payment_method: nil, status: "not_adopted", address_id: 2, user_id: nil},
  {payment_method: nil, status: "not_adopted", address_id: 1, user_id: nil}
])
OrderProduct.create!([
  {quantity: 2, product_instance_id: 1, order_id: 1},
  {quantity: 1, product_instance_id: 2, order_id: 1},
  {quantity: 2, product_instance_id: 1, order_id: 2},
  {quantity: 1, product_instance_id: 2, order_id: 2},
  {quantity: 2, product_instance_id: 1, order_id: 3},
  {quantity: 1, product_instance_id: 2, order_id: 3},
  {quantity: 2, product_instance_id: 1, order_id: 4},
  {quantity: 1, product_instance_id: 2, order_id: 4},
  {quantity: 2, product_instance_id: 1, order_id: 5},
  {quantity: 1, product_instance_id: 2, order_id: 5},
  {quantity: 2, product_instance_id: 1, order_id: 6},
  {quantity: 1, product_instance_id: 2, order_id: 6}
])
Price.create!([
  {value: "255", city_id: 1, product_instance_id: 2},
  {value: "255", city_id: 1, product_instance_id: 3},
  {value: "255", city_id: 1, product_instance_id: 6},
  {value: "255", city_id: 1, product_instance_id: 7},
  {value: "255", city_id: 1, product_instance_id: 8},
  {value: "255", city_id: 1, product_instance_id: 9},
  {value: "255", city_id: 1, product_instance_id: 10},
  {value: "255", city_id: 2, product_instance_id: 11}
])
Product.create!([
  {name: "Margharita", description: "basic pizza with tomato and cheese", category_id: 1, is_topping: false},
  {name: "eferf", description: "ergwewwergwergwergwerg", category_id: 2, is_topping: false}
])
ProductInstance.create!([
  {product_id: 1},
  {product_id: 1},
  {product_id: 1},
  {product_id: 1},
  {product_id: 1},
  {product_id: 1},
  {product_id: 1},
  {product_id: 1},
  {product_id: 1},
  {product_id: 1},
  {product_id: 1}
])
ProductOption.create!([
  {product_instance_id: 1, option_value_id: 1},
  {product_instance_id: 1, option_value_id: 2},
  {product_instance_id: 2, option_value_id: 3},
  {product_instance_id: 2, option_value_id: 4},
  {product_instance_id: 3, option_value_id: 5},
  {product_instance_id: 3, option_value_id: 6},
  {product_instance_id: 6, option_value_id: 7},
  {product_instance_id: 6, option_value_id: 8},
  {product_instance_id: 7, option_value_id: 9},
  {product_instance_id: 7, option_value_id: 10},
  {product_instance_id: 8, option_value_id: 11},
  {product_instance_id: 8, option_value_id: 12},
  {product_instance_id: 9, option_value_id: 13},
  {product_instance_id: 9, option_value_id: 14},
  {product_instance_id: 10, option_value_id: 15},
  {product_instance_id: 10, option_value_id: 16},
  {product_instance_id: 11, option_value_id: 17},
  {product_instance_id: 11, option_value_id: 18}
])
