require 'rails_helper'

describe "process of updating a product" do

  before do
    User.destroy_all
    guest = User.create(:email => "guest@guest.com", :password => "guestguest", :admin => false)
    visit products_path
    click_button "Sign in"
    fill_in "Email", :with => 'guest@guest.com'
    fill_in "Password", :with => 'guestguest'
    click_on "Log in"
  end 

  it "no button exists for a guest user to update a product" do 
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    visit("/products/#{product.id}")
    expect(page).to have_no_content('Edit Product')
  end

end 