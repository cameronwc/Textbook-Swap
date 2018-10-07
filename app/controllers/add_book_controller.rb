class AddBookController < ApplicationController
  def index
  end

  def create
    @createdBook = Book.create(:isbn => params['isbn'], :title => params['title'], :edition => params['edition'], :author => params['author'], :condition => params['condition'], :price => params['price'])
    @createdBook.save!
  end
end
