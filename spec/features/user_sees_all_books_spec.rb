require 'rails_helper'

describe 'user visits the book index page' do
  it 'sees a list of all book titles' do
    book1 = Book.create(title: "Ender's Game")
    book2 = Book.create(title: "The Shining")

    visit books_path

    expect(page).to have_content(book1.title)
    expect(page).to have_content(book2.title)
  end
  it 'sees that book titles are links to show page' do
    book1 = Book.create(title: "Ender's Game")

    visit books_path

    click_on book1.title

    expect(current_path).to eq(book_path(book1))
  end
end
