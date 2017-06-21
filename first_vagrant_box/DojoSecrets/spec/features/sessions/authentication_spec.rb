require 'rails_helper'
feature 'authentication feature' do
  feature "user attempts to sign-in" do
    scenario 'visits sign-in page, prompted with email and password fields'
    scenario 'logs in user if email/password combination is valid'
    scenario 'does not sign in user if email is not found'
    scenario 'does not sign in user if email/password combination is invalid'
  end
  feature "user attempts to log out" do
    scenario 'displays "Log Out" button when user is logged on'
    scenario 'logs out user and redirects to login page'
  end
end
