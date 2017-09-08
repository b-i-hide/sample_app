require 'rails_helper'

RSpec.feature "UsersSignups", type: :feature do
  specify "invalid signup information" do
    visit signup_path
    fill_in 'Name', with: ''
    fill_in 'Email', with: 'foo@invalid'
    fill_in 'Password', with: 'foo'
    fill_in 'Confirmation', with: 'bar'
    expect{ click_button 'Create my account' }.not_to change{ User.count }
    expect(page).to have_selector('h1', text: 'Sign up')
  end

  specify "vlaid signup infomation" do
    visit signup_path
    fill_in 'Name', with: 'test'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: '87654321'
    fill_in 'Confirmation', with: '87654321'
    expect{ click_button 'Create my account' }.to change{ User.count }.by(1)
    expect(page).to have_selector('div.alert')
  end
end
