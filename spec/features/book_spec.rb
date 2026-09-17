require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'sunny day: successfully adding a book' do
        visit new_book_path
        fill_in 'book[title]', with: 'Gregor the Overlander'
        fill_in 'book[author]', with: 'Suzanne Collins'
        fill_in 'book[price]', with: '15.00'
        select '2003', from: 'book_published_date_1i'
        click_button 'Create Book'
        expect(page).to have_content('Book successfully created')
        expect(page).to have_content('Gregor the Overlander')
    end

    scenario 'rainy day: failing to add a book with blank title' do
        visit new_book_path
        fill_in 'book[title]', with: ''
        click_button 'Create Book'

        # Adjust text to match your controller/view flash or validation message
        expect(page).to have_content("Title can't be blank")
    end

    scenario 'rainy day: failing to add a book with blank author' do
        visit new_book_path
        fill_in 'book[title]', with: 'Gregor the Overlander'
        fill_in 'book[author]', with: ''
        fill_in 'book[price]', with: '15.00'
        select '2003', from: 'book_published_date_1i' # Date helper drop-downs
        click_button 'Create Book'
        expect(page).to have_content("Author can't be blank")
    end

    scenario 'rainy day: failing to add a book with non-numerical price' do
        visit new_book_path
        fill_in 'book[title]', with: 'Gregor the Overlander'
        fill_in 'book[author]', with: 'Suzanne Collins'
        fill_in 'book[price]', with: 'ABC'
        click_button 'Create Book'
        expect(page).to have_content("Price is not a number")
    end

    scenario 'creating a book with a published date' do
        visit new_book_path
        fill_in 'book[title]', with: 'Gregor the Overlander'
        fill_in 'book[author]', with: 'Suzanne Collins'
        fill_in 'book[price]', with: '15.00'
        select '2003', from: 'book_published_date_1i'
        select 'September', from: 'book_published_date_2i'
        select '1', from: 'book_published_date_3i'
        click_button 'Create Book'
        expect(page).to have_content('Book successfully created')
        expect(page).to have_content('2003')
    end
    
end