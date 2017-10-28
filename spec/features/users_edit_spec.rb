require 'rails_helper'

RSpec.feature "UsersEdit", type: :feature do
  before do
    @user = create :michael
  end

  scenario "unsuccessful edit" do
    log_in_as(@user)
    visit edit_user_path(@user)
    expect(page).to have_selector 'h1', text: 'Update your profile'
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'foo'
    fill_in 'Confirmation', with: 'bar'
    click_button 'Save changes'
    expect(page).to have_selector 'h1', text: 'Update your profile'
    expect(page).to have_selector '.alert', text: 'The form contains 2 errors.'
    expect(page).to have_selector 'li', text: "Password confirmation doesn't match Password"
    expect(page).to have_selector 'li', text: 'Password is too short (minimum is 6 characters)'
  end

  scenario "successful edit" do
    log_in_as(@user)
    visit edit_user_path(@user)
    expect(current_path).to eq edit_user_path(@user)
    name = 'Hideaki'
    email = 'hoge@hoge.com'
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: ''
    fill_in 'Confirmation', with: ''
    click_button 'Save changes'
    expect(current_path).to eq user_path(@user)
    @user.reload
    expect(page).to have_selector '.alert', text: 'Profile updated'
    expect(page).to have_selector 'h1', text: name
    expect(@user.name).to eq name
    expect(@user.email).to eq email
  end
end
