require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a product with four fields set successfully' do
      @category = Category.new(name: "TestCategory")
      @product = Product.create(name: "name", price: 100, quantity: 1, category: @category)
      expect(@product).to be_valid
    end

    it 'should not have a nil value for name' do
      @category = Category.new(name: "TestCategory")
      @product = Product.create(name: nil, price: 100, quantity: 1, category: @category)
      expect(@product.errors.full_messages).to include ("Name can't be blank")
    end

    it 'should not have a nil value for price' do
      @category = Category.new(name: "TestCategory")
      @product = Product.create(name: "name", price: nil, quantity: 1, category: @category)
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end

    it 'should not have a nil value for quantity' do
      @category = Category.new(name: "TestCategory")
      @product = Product.create(name: "name", price: 100, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end

    it 'should not have a nil value for category' do
      @category = Category.new(name: "TestCategory")
      @product = Product.create(name: "name", price: 100, quantity: 1, category: nil)
      expect(@product.errors.full_messages).to include ("Category can't be blank")
    end

  end
end
