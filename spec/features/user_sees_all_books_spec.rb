require 'rails_helper'

describe 'user visits the book index page' do
  it 'sees a list of all book titles' do
    book1 = Book.create(title: "Ender's Game")
    book2 = Book.create(title: "The Shining")

    visit books_path

    expect(page).to have_content(book1.title)
    expect(page).to have_content(book2.title)
  end
end
