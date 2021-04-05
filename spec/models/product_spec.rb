require 'rails_helper'

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do 
    @category = Category.new(name: "example")
    @subject = Product.new ({ 
      name: "example",
      price_cents: 1000,
      quantity: 10,
      category: @category
      })
    end

    it 'is invalid if there is no name' do
      @subject.name = nil
      expect(@subject).to_not be_valid
      # puts(@subject.errors.full_messages)
      expect(@subject.errors.full_messages).to include "Name can't be blank"
    end 
    it 'is invalid without a price' do
      @subject.price_cents = nil
      expect(@subject).to_not be_valid
      # puts(@subject.errors.full_messages)
      expect(@subject.errors.full_messages).to include "Price cents is not a number"
    end
      it 'is invalid without a quantity' do
      @subject.quantity = nil
      expect(@subject).to_not be_valid
      # puts(@subject.errors.full_messages)
      expect(@subject.errors.full_messages).to include "Quantity can't be blank"
    end
    it 'is invalid without a category' do
      @subject.category = nil
      expect(@subject).to_not be_valid
    #  puts(subject.errors.full_messages[0])
     expect(@subject.errors.full_messages).to include "Category can't be blank"
      end
  end
end
