require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
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

  scenario "There are 0 products in cart when the page first renders" do

    visit root_path

    expect(page).to have_link 'My Cart (0)', href: '/cart'

  end

  scenario "1 product is added to cart when add button is clicked" do

    visit root_path
    save_screenshot

    page.find('article', match: :first).find('footer form').click

    expect(page).to have_link 'My Cart (1)', href: '/cart'
    save_screenshot

  end


end