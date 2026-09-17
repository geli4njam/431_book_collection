require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validations' do
        let(:valid_attributes) do
            {
                title: 'Gregor the Overlander',
                author: 'Suzanne Collins',
                price: 15.00,
                published_date: Date.new(2003, 9, 1)
            }
        end
        it 'is valid with a title' do
            book = Book.new(valid_attributes)
            expect(book).to be_valid
        end 

        it 'is valid with a author' do
            book = Book.new(valid_attributes)
            expect(book).to be_valid
        end 

        it 'is valid with a numerical price' do
            book = Book.new(valid_attributes)
            expect(book).to be_valid
        end 

        it 'is valid with a published date' do
            book = Book.new(valid_attributes)
            expect(book).to be_valid
        end 

        it 'is invalid without a title (rainy day)' do
            book = Book.new(valid_attributes.merge(title: nil))
            expect(book).not_to be_valid
        end

        it 'is invalid without a author (rainy day)' do
            book = Book.new(valid_attributes.merge(author: nil))
            expect(book).not_to be_valid
        end

        it 'is invalid without a numerical price (rainy day)' do
            book = Book.new(valid_attributes.merge(price: nil))
            expect(book).not_to be_valid
        end

        it 'is invalid without a pubslished date (rainy day)' do
            book = Book.new(valid_attributes.merge(published_date: nil))
            expect(book).not_to be_valid
        end
  end
end