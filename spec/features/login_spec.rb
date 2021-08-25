require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(username: "funbucket13", password: "test")

    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to_not have_link("I already have an account")
    expect(page).to_not have_link("Register as a User")
    expect(page).to have_link("Log Out")

    click_link "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_link("I already have an account")
    expect(page).to have_link("Register as a User")
    expect(page).to_not have_link("Log Out")

  end

  it "can't log in with invalid credentials" do
    user = User.create(username: "funbucket13", password: "test")

    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: "wrongpassword"

    click_on "Log In"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Credentials were bad. Try again.")
  end

  require "rails_helper"

  describe "Admin login" do
    describe "happy path" do
      it "I can log in as an admin and get to my dashboard" do
        admin = User.create(username: "superuser@awesome-site.com",
                          password: "super_secret_passw0rd",
                          role: 1)
        # require 'pry'; binding.pry

        visit login_path
        fill_in :username, with: admin.username
        fill_in :password, with: admin.password
        click_button 'Log In'

        expect(current_path).to eq(admin_dashboard_path)
      end
    end
    describe "sad path" do
      it "As a default user, I cant access the admin dashboard page" do
        default_user = User.create(username: "superuser@awesome-site.com",
                          password: "super_secret_passw0rd")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

        visit admin_dashboard_path
        
        expect(page).to have_content("You're not authorized to be here.")
        expect(current_path).to eq(root_path)
      end
    end
  end
end