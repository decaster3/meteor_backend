# frozen_string_literal: true

Country.create!([
                  { name: 'Japan' }
                ])
City.create!([
               { name: 'Osaka', schedule: '{ "opens_at": "8am", "closes_at": "11pm"}', country_id: 1, currency: 'JPY', phone: '58000000000' }
             ])
Category.create!([
                   { name: 'Pizza' }
                 ])
OptionName.create!([
                     { name: 'size', category_id: 1, is_characteristic: nil, is_belongs: false },
                     { name: 'dough', category_id: 1, is_characteristic: nil, is_belongs: false },
                     { name: 'weight', category_id: 1, is_characteristic: nil, is_belongs: true }
                   ])
Product.create!([
                  { name: 'Margherita', description: 'Pizza Margherita is a typical Neapolitan pizza, made with San Marzano tomatoes, mozzarella fior di latte, fresh basil, salt and extra-virgin olive oil.', category_id: 1, is_topping: false },
                  { name: 'Hawaiian', description: 'Hawaiian pizza is a pizza topped with tomato sauce, cheese, pineapple, and back bacon or ham.', category_id: 1, is_topping: false }
                ])
ProductInstance.create!([
                          { product_id: 1 },
                          { product_id: 1 },
                          { product_id: 1 },
                          { product_id: 1 },
                          { product_id: 1 },
                          { product_id: 1 },
                          { product_id: 2 },
                          { product_id: 2 },
                          { product_id: 2 },
                          { product_id: 2 },
                          { product_id: 2 },
                          { product_id: 2 }
                        ])
OptionValue.create!([
                      { value: '28 cm', option_name_id: 1 },
                      { value: '38 cm', option_name_id: 1 },
                      { value: '42 cm', option_name_id: 1 },
                      { value: 'thin', option_name_id: 2 },
                      { value: 'thick', option_name_id: 2 },
                      { value: '750 g', option_name_id: 3 },
                      { value: '650 g', option_name_id: 3 },
                      { value: '550 g', option_name_id: 3 },
                      { value: '850 g', option_name_id: 3 },
                      { value: '750 g', option_name_id: 3 },
                      { value: '650 g', option_name_id: 3 },
                      { value: '785 g', option_name_id: 3 },
                      { value: '685 g', option_name_id: 3 },
                      { value: '585 g', option_name_id: 3 },
                      { value: '885 g', option_name_id: 3 },
                      { value: '785 g', option_name_id: 3 },
                      { value: '685 g', option_name_id: 3 }
                    ])
City.find(1).products << Product.find(1)
City.find(1).products << Product.find(2)
Price.create!([
                { value: '255', city_id: 1, product_instance_id: 1 },
                { value: '200', city_id: 1, product_instance_id: 2 },
                { value: '188', city_id: 1, product_instance_id: 3 },
                { value: '188', city_id: 1, product_instance_id: 4 },
                { value: '200', city_id: 1, product_instance_id: 5 },
                { value: '255', city_id: 1, product_instance_id: 6 },
                { value: '285', city_id: 1, product_instance_id: 7 },
                { value: '230', city_id: 1, product_instance_id: 8 },
                { value: '218', city_id: 1, product_instance_id: 9 },
                { value: '218', city_id: 1, product_instance_id: 10 },
                { value: '230', city_id: 1, product_instance_id: 11 },
                { value: '285', city_id: 1, product_instance_id: 12 }
              ])
ProductOption.create!([
                        { product_instance_id: 1, option_value_id: 3 },
                        { product_instance_id: 2, option_value_id: 2 },
                        { product_instance_id: 3, option_value_id: 1 },
                        { product_instance_id: 3, option_value_id: 5 },
                        { product_instance_id: 2, option_value_id: 5 },
                        { product_instance_id: 1, option_value_id: 5 },
                        { product_instance_id: 4, option_value_id: 4 },
                        { product_instance_id: 5, option_value_id: 4 },
                        { product_instance_id: 6, option_value_id: 4 },
                        { product_instance_id: 4, option_value_id: 1 },
                        { product_instance_id: 5, option_value_id: 2 },
                        { product_instance_id: 6, option_value_id: 3 },
                        { product_instance_id: 6, option_value_id: 6 },
                        { product_instance_id: 5, option_value_id: 7 },
                        { product_instance_id: 4, option_value_id: 8 },
                        { product_instance_id: 1, option_value_id: 9 },
                        { product_instance_id: 2, option_value_id: 10 },
                        { product_instance_id: 3, option_value_id: 11 },

                        { product_instance_id: 7, option_value_id: 1 },
                        { product_instance_id: 7, option_value_id: 4 },
                        { product_instance_id: 7, option_value_id: 12 },

                        { product_instance_id: 8, option_value_id: 2 },
                        { product_instance_id: 8, option_value_id: 4 },
                        { product_instance_id: 8, option_value_id: 13 },

                        { product_instance_id: 9, option_value_id: 3 },
                        { product_instance_id: 9, option_value_id: 4 },
                        { product_instance_id: 9, option_value_id: 14 },

                        { product_instance_id: 10, option_value_id: 1 },
                        { product_instance_id: 10, option_value_id: 5 },
                        { product_instance_id: 10, option_value_id: 15 },

                        { product_instance_id: 11, option_value_id: 2 },
                        { product_instance_id: 11, option_value_id: 5 },
                        { product_instance_id: 11, option_value_id: 16 },

                        { product_instance_id: 12, option_value_id: 3 },
                        { product_instance_id: 12, option_value_id: 5 },
                        { product_instance_id: 12, option_value_id: 17 }

                      ])
