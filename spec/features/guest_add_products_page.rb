require 'rails_helper'

describe "process of adding a product" do

  before do
    User.destroy_all
    guest = User.create(:email => "guest@guest.com", :password => "guestguest", :admin => false)
    visit products_path
    click_button "Sign in"
    fill_in "Email", :with => 'guest@guest.com'
    fill_in "Password", :with => 'guestguest'
    click_on "Log in"
  end 

  it "gives an error when a guest user attempts to access the add a product page" do 
    visit new_product_path 
    expect(page).to have_content "Uh Oh, administrator privileges are required to access this page."
  end

end 
