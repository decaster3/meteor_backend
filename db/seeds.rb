# frozen_string_literal: true

Country.create!([
                    {name: 'Япония'},
                    {name: 'Корея'},
                    {name: 'Россия'},
                ])
City.create!([
                 {name: 'Осака', schedule: '{ "opens_at": "8am", "closes_at": "11pm"}', country_id: 1, currency: 'JPY', phone: '83000000000'},
                 {name: 'Иннополис', schedule: '{ "opens_at": "8am", "closes_at": "11pm"}', country_id: 3, currency: 'RUB', phone: '+7000000000', google_key: 'Innopolis'},
                 {name: 'Сеул', schedule: '{ "opens_at": "8am", "closes_at": "11pm"}', country_id: 2, currency: 'KOW', phone: '82000000000'}
             ])
Category.create!([
                     {name: 'Пицца'},
                     {name: 'Бургеры'},
                     {name: 'Суши'},
                     {name: 'Закуски'},
                     {name: 'Напитки'}
                 ])
Subcategory.create!(name: "ololo", category_id: 1)
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
                            {product_id: 1},
                            {product_id: 1},
                            {product_id: 1},
                            {product_id: 1},
                            {product_id: 1},
                            {product_id: 1},
                            {product_id: 2},
                            {product_id: 2},
                            {product_id: 2},
                            {product_id: 2},
                            {product_id: 2},
                            {product_id: 2}
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
User.create!(name: "Rinat", phone: "+79991571024", password: "qweqweqwe")
User.create!(name: "Rinat", phone: "+79999999999", password: "qweqweqwe")
