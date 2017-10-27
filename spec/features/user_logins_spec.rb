require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do

  given(:user) { create :michael }

  scenario "login with invalid info" do
    visit login_path
    expect(page).to have_selector 'h1', text: 'Log in'
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Log in'
    expect(page).to have_selector 'h1', text: 'Log in'
    expect(page).to have_selector '.alert'
    visit root_path
    expect(page).not_to have_selector '.alert'
  end

  scenario "login with valid info" do
    visit login_path
    fill_in 'Email', with: user.email
    fill_in "Password", with: "password"
    click_button 'Log in'
    expect(current_path).to eq user_path(user)
    expect(page).to have_selector 'h1', text: user.name
    expect(page).not_to have_link nil, href: login_path
    expect(page).to have_link nil, href: logout_path
    expect(page).to have_link nil, href: user_path(user)
    # TODO: logoutのテストをあとで追加
  end
end
