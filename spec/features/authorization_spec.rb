require 'rails_helper'

RSpec.describe 'Authorization checks' do
  describe "as default user" do
    it 'does not allow default user to see admin dashboard index' do
      user = User.create(
        email: "fern@gully.com",
        password: "password",
        role: 0
      )
      
      # mock logging in as a user
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Your permissions are bad and you should feel bad")
    end
  end
end