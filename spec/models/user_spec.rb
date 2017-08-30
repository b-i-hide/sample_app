require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(name: 'Sample User', email: 'sample@example.com', password: 'foobar', password_confirmation: 'foobar')
  end

  it "should be valid" do
    expect(user).to be_valid
  end

  specify "name should be present" do
    user.name = ""
    expect(user).to be_invalid
  end

  specify "email should be present" do
    user.email = ""
    expect(user).to be_invalid
  end

  specify "name should not be too long" do
    user.name = 'a' * 51
    expect(user).to be_invalid

    user.name = 'a' * 50
    expect(user).to be_valid
  end

  specify "email should not be too long" do
    user.email = 'a' * 244 + '@example.com'
    expect(user).to be_invalid

    user.email = 'a' * 243 + '@example.com'
    expect(user).to be_valid
  end

  specify "email validation should accept valid address" do
    valid_addresses = %w[user@example.com USER@foo.COM A_U.S-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end

  specify "email validation should reject invalid address" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to be_invalid, "#{invalid_address.inspect} should be invalid"
    end
  end

  specify "email address should be unique" do
    duplicate_user = user.dup
    duplicate_user.email = user.email
    user.save
    expect(duplicate_user).to be_invalid
  end

  specify "email address should be saved as lower-case" do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    user.email = mixed_case_email
    user.save
    address_in_db = mixed_case_email.downcase
    expect(user.email).to eq(address_in_db)
  end

  specify "password should be present" do
    user.password = user.password_confirmation = "" * 6
    expect(user).to be_invalid
  end

  specify "password should have minimun length" do
    user.password = user.password_confirmation = "a" * 5
    expect(user).to be_invalid
  end
end
