KazkomEpay.configure do |c|
  c.cert_id = '00c183d70b'
  c.merchant_name = 'Demo Shop 3'
  c.merchant_id = '92061103'
  c.private_key_path = Rails.root.join("config", "cert", "too_roga_i_kopyta_prv.pem")
  c.private_key_password = "$ecret"
  c.public_key_path = Rails.root.join("config", "cert", "kkbca.pem")
end