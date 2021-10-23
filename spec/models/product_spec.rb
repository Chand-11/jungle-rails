require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  RSpec.describe Product, type: :model do
    describe 'Validations' do
      # when everything is present and saves
      it "saves when all fields are filled" do
        @category = Category.new(name: 'test category')
        @product = @category.products.new(name: 'test product', price: 30, quantity: 3)
        @product.save!

        # no name
     it 'returns an error when the name field is not provided' do
      @category = Category.new(name: 'test category')
      @product = @category.products.new( price: 30, quantity: 3)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

     # no price
     it 'returns an error when the price field is not provided' do
      @category = Category.new(name: 'test category')
      @product = @category.products.new(name: 'test product', quantity: 3)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    # no quantity
    it 'returns an error when the quantity field is not provided' do
      @category = Category.new(name: 'test category')
      @product = @category.products.new(name: 'test product', price: 30)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    # no category
    it 'returns an error when the category field is not provided' do
      @product = Product.new(name: 'test product', price: 30, quantity: 3)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

      

    end
  end
end
