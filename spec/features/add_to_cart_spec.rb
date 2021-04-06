require 'rails_helper'

RSpec.feature "User visits the home page, then clicks add to cart, which increases by 1", type: :feature, js: true do

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

  scenario "Visit the home page, then adds a product to cart increase the count by 1" do
    # ACT
    visit root_path

     # VERIFY
    expect(page).to have_content 'My Cart (0)'

    find(".btn-primary", match: :first).click
    #first(:fa_icon, "shopping-cart").click

    # VERIFY
    expect(page).to have_content 'My Cart (1)'
    
    # DEBUG
    save_screenshot
  end
end
