class WelcomeController < ApplicationController
  def index
    unless cookies[:super_secret]
      cookies.encrypted[:super_secret] = {
        value: 'super_secret_dont_look_please',
        expires: 3.weeks
      }
    end

  end
end
