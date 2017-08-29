require 'rails_helper'

feature 'Site layout' do
  scenario 'layout links' do
    visit root_path
    expect(page).to have_selector('h1', text: 'Welcome to the Sample App')
      .and have_link('sample app', href: root_path)
      .and have_link('Home', href: root_path)
      .and have_link('Help', href: help_path)
      .and have_link('About', href: about_path)
      .and have_link('Contact', href: contact_path)
      .and have_link('Sign up now!', href: signup_path)
  end
end
