require 'rails_helper'

RSpec.feature "User visits the home page, then clicks on a product and is taken to that products page", type: :feature, js: true do

    # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Visit the home page, then click on a product and are taken to that product page" do
    # ACT
    visit root_path
    #find("Details", match: :first).click
    first(:link, "Details").click
    # click_link 'Details' :first

    # VERIFY
    expect(page).to have_css 'article.product-detail'
    
    # DEBUG
    save_screenshot
  end
end
    