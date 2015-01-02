require 'spec_helper'
feature "sign up and sign in", :js => true do
  scenario "sign up specific user" do
    visit '/'
    fill_in 'Email', :with => "sarbada@Jyaasa.com"
    fill_in 'Password', :with => "12345678"
    fill_in 'Password confirmation', :with => '12345678'
    click_button 'Sign up'
    page.should have_content "Welcome! You have signed up successfully."
  end 
end