require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'product will save' do
      new_category = Category.create! name: 'Appliances'
      new_product = new_category.products.create!({
        name: 'Fast Kettle',
        quantity: 15,
        price: 159.99
      })

      expect(new_product).to have_attributes(name: 'Fast Kettle', quantity: 15, price: 159.99, category: new_category)
    end

    it 'validates :name, presence: true' do
      new_category = Category.create! name: 'Movies'
      expect(new_category.products.create!({
        quantity: 5,
        price: 50.00
      })).to_not be_valid

      expect(new_product[:name]).to_not be_valid
      # expect(nil.errors.message[:nil]).to eq ['is invalid']
    end

    it 'validates :price, presence: true' do
      new_category = Category.create! name: 'Music'
      new_product = new_category.products.create!({
        name: 'Red to Purple',
        quantity: 21,
        price: 15.00
      })
      
      expect(nil).to_not be_valid
      # expect(nil.errors.message[:nil]).to eq ['is invalid']
    end

    it 'validates :quantity, presence: true' do
      new_category = Category.create! name: 'Accessories'
      new_product = new_category.products.create!({
        name: 'Most rugged phone case',
        quantity: 17,
        price: 45.99
      })
      
      expect(nil).to_not be_valid
      # expect(nil.errors.message[:nil]).to eq ['is invalid']
    end

    it 'validates :category, presence: true' do
      new_category = Category.create! name: 'Office Supplies'
      new_product = new_category.products.create!({
        name: 'Never drying printer ink',
        quantity: 20,
        price: 69.99
      })
      
      expect(nil).to_not be_valid
      # expect(nil.errors.message[:nil]).to eq ['is invalid']
    end
  end
end
