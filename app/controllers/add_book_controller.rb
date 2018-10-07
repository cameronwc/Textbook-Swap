class AddBookController < ApplicationController
  def index
  end

  def create
    @createdBook = Book.create(:isbn => params['isbn'], :title => params['title'], :edition => params['edition'], :condition => params['condition'], :price => params['price'])
    @createdBook.save!
    redirect_to "/"
  end

  def similar
    @returnedBooks = Book.where(:isbn => params['isbn']).limit(params['limit'])
    puts @returnedBooks
    render :json => @returnedBooks.to_json
  end
end
