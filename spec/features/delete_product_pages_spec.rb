require 'rails_helper'

describe "process of deleting a product" do

  before do
    User.destroy_all
    admin = User.create(:email => "admin@admin.com", :password => "adminadmin", :admin => true)
    visit products_path
    click_button "Sign in"
    fill_in "Email", :with => 'admin@admin.com'
    fill_in "Password", :with => 'adminadmin'
    click_on "Log in"
  end
  
  it "deletes a new product" do
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    visit("/products/#{product.id}")
    click_on 'Delete Product'
    expect(page).to have_content 'Product and all associated reviews have been deleted.'
  end
end