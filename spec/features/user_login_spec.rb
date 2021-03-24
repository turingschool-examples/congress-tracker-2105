require 'rails_helper'

describe "Loggin In" do
  it "with valid credentials" do
    user = User.create(email: 'alex@email.com', password: 'password')
    visit root_path
    click_link "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log In"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome #{user.email}!")
    expect(page).to_not have_link('I already have an account')
    expect(page).to_not have_link('Register As A User')
    expect(page).to have_link('Log Out')
  end

  it "with invalid credentials" do
    user = User.create(email: 'alex@email.com', password: 'password')
    # As a registered user
    # When I visit '/'
    visit root_path
    # and I click on a link that says "I already have an account"
    click_link "I already have an account"
    # Then I should see a login form
    expect(current_path).to eq(login_path)
    # When I enter my username and password
    fill_in :email, with: user.email
    fill_in :password, with: 'notmypassword'
    # and submit the form
    click_button "Log In"
    # I am redirected to the home page
    expect(current_path).to eq(login_path)
    # and I see a welcome message with my username
    expect(page).to have_content("email or password is incorrect")
  end
end
