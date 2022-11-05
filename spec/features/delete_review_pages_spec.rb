describe "deleting a review" do

  before do
    User.destroy_all
    admin = User.create(:email => "admin@admin.com", :password => "adminadmin", :admin => true)
    visit products_path
    click_button "Sign in"
    fill_in "Email", :with => 'admin@admin.com'
    fill_in "Password", :with => 'adminadmin'
    click_on "Log in"
  end
  
  it "deletes a review" do
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    review = Review.create({:author => 'Paul', :content_body => 'Good stuff, I love the fragrant smell. It is out of this world.', :rating => 5 , :product_id => product.id})
    visit("/products/#{product.id}/reviews/#{review.id}")
    click_on 'Delete Review'
    expect(page).to have_content 'Review has been deleted.'
  end
end
