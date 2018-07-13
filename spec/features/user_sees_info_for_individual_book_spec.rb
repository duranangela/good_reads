require 'rails_helper'

describe 'user visits book show page' do
  it 'user sees book title and list of reviews for that book' do
    book = Book.create(title: "Ender's Game")
    user1 = User.create(name: 'Bob Jones')
    user2 = User.create(name: 'Mary Brown')
    review1 = book.reviews.create(content: 'Excellent book!', rating: 5, user_id: user1.id)
    review2 = book.reviews.create(content: 'Card sucks!', rating: 2, user_id: user2.id)

    visit book_path(book)

    expect(page).to have_content(book.title)
    expect(page).to have_content(review1.content)
    expect(page).to have_content(review1.rating)
    expect(page).to have_content(user1.name)
    expect(page).to have_content(review2.content)
    expect(page).to have_content(review2.rating)
    expect(page).to have_content(user2.name)
  end
end
