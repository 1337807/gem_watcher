require 'spec_helper'

feature 'User saves a list' do
  before :all do
    sign_up
  end

  scenario 'with body and no url' do
    body = Faker::Lorem.words(10).join("\r")
    visit root_path
    fill_in :list_body, with: body
    click_button 'Save'

    expect(List.last.body).to eql(body)
  end
end
