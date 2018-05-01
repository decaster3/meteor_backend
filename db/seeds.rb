product1 = Product.create({
  name: 'Margarita', 
  description: 'Awesome pizza'
})

productInstance1 = ProductInstance.create({
  product_id: product1.id
})
# })
###############
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
sizeOption1 = OptionValue.create({
  option_name_id: option1.id,
  value: '32'
})
sizeOption2 = OptionValue.create({
  option_name_id: option1.id,
  value: '42'
})
sizeOption2 = OptionValue.create({
  option_name_id: option2.id,
  value: '52'
})
# ###############
testoOption1 = OptionValue.create({
  option_name_id: option2.id,
  value: 'slim'
})
testoOption2 = OptionValue.create({
  option_name_id: option2.id,
  value: 'tasty'
})
################
costOption1 = OptionValue.create({
  option_name_id: option3.id,
  value: '140'
})
costOption3 = OptionValue.create({
  option_name_id: option3.id,
  value: '240'
})
costOption4 = OptionValue.create({
  option_name_id: option3.id,
  value: '540'
})
###############
weightOption1 = OptionValue.create({
  option_name_id: option4.id,
  value: '1'
})
weightOption2 = OptionValue.create({
  option_name_id: option4.id,
  value: '2'
})
weightOption3 = OptionValue.create({
  option_name_id: option4.id,
  value: '3'
})
weightOption4 = OptionValue.create({
  option_name_id: option4.id,
  value: '4'
})
weightOption5 = OptionValue.create({
  option_name_id: option4.id,
  value: '5'
})
weightOption6 = OptionValue.create({
  option_name_id: option4.id,
  value: '6'
})
######################
ProductOption.create({
  product_instance_id: productInstance1.id,
  option_value_id: sizeOption1.id,
})
ProductOption.create({
  product_instance_id: productInstance1.id,
  option_value_id: testoOption1.id,
})
ProductOption.create({
  product_instance_id: productInstance1.id,
  option_value_id: costOption1.id,
})
ProductOption.create({
  product_instance_id: productInstance1.id,
  option_value_id: weightOption1.id,
})
#####################