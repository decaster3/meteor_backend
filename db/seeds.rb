product1 = Product.create({
  name: 'Margarita',
  description: 'Awesome pizza'
})

product_instance1 = ProductInstance.create({
  product_id: product1.id
})
##############
option1 = OptionName.create({
  name: 'Size'
})
option2 = OptionName.create({
  name: 'Testo'
})
option3 = OptionName.create({
  name: 'Cost'
})
option4 = OptionName.create({
  name: 'Weight'
})
##############
size_option1 = OptionValue.create({
  option_name_id: option1.id,
  value: '32'
})
size_option2 = OptionValue.create({
  option_name_id: option1.id,
  value: '42'
})
size_option2 = OptionValue.create({
  option_name_id: option2.id,
  value: '52'
})
##############
dough_option1 = OptionValue.create({
  option_name_id: option2.id,
  value: 'slim'
})
dough_option2 = OptionValue.create({
  option_name_id: option2.id,
  value: 'tasty'
})
##############
cost_option1 = OptionValue.create({
  option_name_id: option3.id,
  value: '140'
})
cost_option3 = OptionValue.create({
  option_name_id: option3.id,
  value: '240'
})
cost_option4 = OptionValue.create({
  option_name_id: option3.id,
  value: '540'
})
##############
weight_option1 = OptionValue.create({
  option_name_id: option4.id,
  value: '1'
})
weight_option2 = OptionValue.create({
  option_name_id: option4.id,
  value: '2'
})
weight_option3 = OptionValue.create({
  option_name_id: option4.id,
  value: '3'
})
weight_option4 = OptionValue.create({
  option_name_id: option4.id,
  value: '4'
})
weight_option5 = OptionValue.create({
  option_name_id: option4.id,
  value: '5'
})
weight_option6 = OptionValue.create({
  option_name_id: option4.id,
  value: '6'
})
##############
ProductOption.create({
  product_instance_id: product_instance1.id,
  option_value_id: size_option1.id,
})
ProductOption.create({
  product_instance_id: product_instance1.id,
  option_value_id: dough_option1.id,
})
ProductOption.create({
  product_instance_id: product_instance1.id,
  option_value_id: cost_option1.id,
})
ProductOption.create({
  product_instance_id: product_instance1.id,
  option_value_id: weight_option1.id,
})
##############