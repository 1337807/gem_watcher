require 'spec_helper'

feature 'User saves a list' do
  before :each do
    sign_up
  end

  scenario 'without a body or a url' do
    visit root_path
    click_button 'Save'

    expect(page).to have_content('You must include either a list of gems or a file where we can extract the list.')
  end

  scenario 'with a body and without a url' do
    body = Faker::Lorem.words(10).join("\r")
    visit root_path
    fill_in :list_body, with: body
    click_button 'Save'

    expect(List.last.body).to eql(body)
  end

  scenario 'with a url and without a body' do
    url = Faker::Internet.url
    visit root_path
    fill_in :list_url, with: url
    click_button 'Save'

    expect(List.last.url).to eql(url)
  end

  scenario 'with a body and a url' do
    body = Faker::Lorem.words(10).join("\r")
    url = Faker::Internet.url
    visit root_path
    fill_in :list_body, with: body
    fill_in :list_url, with: url
    click_button 'Save'

    expect(List.last.body).to eql(body)
    expect(List.last.url).to eql(url)
  end
end
