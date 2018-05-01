Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
RSpec.configuration do |config|
  config.include RequestSpecHelper, type: :request
end