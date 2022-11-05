require 'rails_helper'

describe "process of updating a review" do

  before do
    User.destroy_all
    guest = User.create(:email => "guest@guest.com", :password => "guestguest", :admin => false)
    visit products_path
    click_button "Sign in"
    fill_in "Email", :with => 'guest@guest.com'
    fill_in "Password", :with => 'guestguest'
    click_on "Log in"
  end 

  it "error is thrown for a guest user attempting to update a review" do 
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    review = Review.create({:author => 'Paul', :content_body => 'Good stuff, I love the fragrant smell. It is out of this world.', :rating => 5 , :product_id => product.id})
    visit("/products/#{product.id}/reviews/#{review.id}")
    expect(page).to have_content "Uh Oh, administrator privileges are required to access this page."
  end

end 