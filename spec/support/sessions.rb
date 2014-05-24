module SessionsHelper
  def sign_up
    sign_up_with Faker::Internet.email, Faker::Bitcoin.address
  end

  def sign_up_with(email, password)
    visit new_user_registration_path
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    click_button 'Sign up'
  end
end

RSpec.configure do |config|
  config.include SessionsHelper, type: :feature
end
