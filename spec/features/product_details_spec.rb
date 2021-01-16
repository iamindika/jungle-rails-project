require 'rails_helper'

RSpec.feature "Visitor views details of item", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details" do
    visit root_path
    first('a.btn.btn-default.pull-right').click
    sleep(1)
    save_screenshot
    puts page.html

    expect(page).to have_css '.products-show'
  end
end
