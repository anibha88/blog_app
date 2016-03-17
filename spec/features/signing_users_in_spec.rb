require 'rails_helper'

RSpec.feature 'users sign-in' do 
  
  before do
    @nithin = User.create!(email: 'nithin@example.com', password: 'password')
  end

  scenario 'sign-in with valid credentials' do 
    visit '/'
    click_link 'Sign in'

    fill_in "Email", with: @nithin.email
    fill_in "Password", with: @nithin.password
    click_button "Log in"

    expect(page).to have_content ("Signed in successfully.")
    expect(page).to have_content ("Signed in as #{@nithin.email}")
  end
end