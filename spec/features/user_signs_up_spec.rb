require 'spec_helper'

feature 'User signs up' do
  scenario 'with valid email and password' do
    email = Faker::Internet.email
    sign_up_with email, Faker::Bitcoin.address
    expect(page).to have_content("Signed in as #{email}")
  end
end
