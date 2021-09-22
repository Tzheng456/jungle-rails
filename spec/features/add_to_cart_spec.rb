require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

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

  scenario "should display a cart with 0 items 'My Cart (0)' on the page" do

    visit root_path

    save_screenshot

    expect(page).to have_content 'My Cart (0)'

    save_screenshot

  end

  scenario "should display a cart with 1 items 'My Cart (1)' after an item is added" do

    visit root_path

    save_screenshot

    page.find('article.product', match: :first).find('footer form button').click

    expect(page).to have_content 'My Cart (1)'

    save_screenshot

  end

end
