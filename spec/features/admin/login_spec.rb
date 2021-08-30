require "rails_helper"

describe "Admin login" do
  describe "happy path" do
    it "I can log in as an admin and get to my dashboard" do
	    admin = User.create(username: "superuser@awesome-site.com",
                        password: "super_secret_passw0rd",
                        role: 1)

      visit login_path
      fill_in :username, with: admin.username
      fill_in :password, with: "super_secret_passw0rd"
      click_button 'Log in'

      expect(current_path).to eq(admin_dashboard_path)
    end
  end
  describe "sad path" do
    it 'I cant access the admin dashboard as a default user' do
      user = User.create(username: "fern@gully.com",
                         password: "password",
                         role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/admin/dashboard"

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end