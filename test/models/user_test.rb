require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(
      phone: '1' * 9,
      password: 'password',
      password_confirmation: 'password'
    )
  end

  test 'user should be valid' do
    assert @user.valid?
  end
end
