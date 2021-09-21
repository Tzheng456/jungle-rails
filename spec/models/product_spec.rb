require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a product with four fields set successfully' do
      @category = Category.new(name: "TestCategory")
      @product = Product.create(name: "name", price: 100, quantity: 1, category: @category)
      expect(@product).to be_present
    end

    it 'should not have a nil value for name' do
      @category = Category.new(name: "TestCategory")
      @product = Product.create(name: nil, price: 100, quantity: 1, category: @category)
      expect(@product.errors.full_messages).to include ("Name can't be blank")
    end

  end
end
