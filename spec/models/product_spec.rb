require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    it 'should save successfully with all four fields filled' do 
      category = Category.new(name: 'Test Category')
      product = Product.new(
        name: 'Peonies',
        price_cents: 50000,
        quantity: 8,
        category: category
      )
      
      expect(product).to be_valid 
    end 
    
    it 'should NOT save successfully when name is not inputted' do 
      category = Category.new(name: 'Test Category')
      product = Product.new(
        name: nil, 
        price_cents: 80000, 
        quantity: 11, 
        category: category
      )

      expect(product).to_not be_valid 
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should NOT save successfully when quantity is not inputted' do 
      category = Category.new(name: 'Test Category')
      product = Product.new(
        name: 'Orchids', 
        price_cents: 70000, 
        quantity: nil, 
        category: category
      )

      expect(product).to_not be_valid 
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

     it 'should NOT save successfully when price is not inputted' do 
      category = Category.new(name: 'Test Category')
      product = Product.new(
        name: 'Roses', 
        price_cents: nil, 
        quantity: 8, 
        category: category
      )

      expect(product).to_not be_valid 
      expect(product.errors.full_messages).to include("Price cents can't be blank")
    end

    it 'should NOT save successfully when category is not inputted' do 
      product = Product.new(
        name: 'Lilies',
        price_cents: 20000,
        quantity: 3, 
        category: nil 
      )
  
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end 

  end 
end
