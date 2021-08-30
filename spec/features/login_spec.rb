require 'rails_helper'

describe 'logging in' do 
    it 'as a registered user, I can log in with correct credentials' do 
        user = User.create(username: 'meg@ex.com', password: 'ilovedogs')
        
        visit root_path

        click_link "I already have an account"

        expect(current_path).to eq("/login")
        
        fill_in :username, with: "meg@ex.com"
        fill_in :password, with: "ilovedogs"
        
        click_button "Log in"
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Welcome, meg@ex.com!")
        expect(page).to_not have_link("I already have an account")
        expect(page).to_not have_link("Register as a User")
        expect(page).to have_link("Log out")
        
        click_link("Log out")
        
        expect(current_path).to eq(root_path)
        expect(page).to_not have_link("Log out")
        expect(page).to have_link("I already have an account")
        expect(page).to have_link("Register as a User")
    end 

    it 'as a registered user, I cant log in with incorrect credentials' do 
        user = User.create(username: 'meg@ex.com', password: 'ilovedogs')
        
        visit root_path

        click_link "I already have an account"

        expect(current_path).to eq(login_path)
        
        fill_in :username, with: "meg@ex.com"
        fill_in :password, with: "ilovecats"
        
        click_button "Log in"
        
        expect(current_path).to eq(login_path)
        expect(page).to have_content("Your username or password are incorrect")

    end 
end 