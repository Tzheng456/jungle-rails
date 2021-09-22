require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario "should display product details when a user clicks on product text" do

    visit root_path

    save_screenshot

    page.find('article.product', match: :first).find('header a h4').click

    expect(page).to have_css 'section.products-show'

    save_screenshot

  end  

  scenario "should display product details when a user clicks on product image" do

    visit root_path

    save_screenshot

    page.find('article.product', match: :first).find('header a img').click

    expect(page).to have_css 'section.products-show'

    save_screenshot

  end  

  scenario "should display product details when a user clicks on 'Details' button" do

    visit root_path

    save_screenshot

    page.find('article.product', match: :first).find('footer a').click

    expect(page).to have_css 'section.products-show'

    save_screenshot

  end  

end
