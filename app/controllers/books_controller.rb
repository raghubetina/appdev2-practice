class BooksController < ApplicationController
  def list
    matching_books = Book.all

    @list_of_books = matching_books.order({ :created_at => :desc })

    render({ :template => "book_templates/list.html.erb" })
  end

  def details
    the_id = params.fetch("path_id")

    matching_books = Book.where({ :id => the_id })

    @the_book = matching_books.at(0)

    render({ :template => "book_templates/details.html.erb" })
  end

  def create
    the_book = Book.new
    the_book.title = params.fetch("query_title")
    the_book.description = params.fetch("query_description")
    the_book.released_at = params.fetch("query_released_at")
    the_book.popular = params.fetch("query_popular", false)

    if the_book.valid?
      the_book.save
      redirect_to("/books", { :notice => "Book created successfully." })
    else
      redirect_to("/books", { :notice => "Book failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_book = Book.where({ :id => the_id }).at(0)

    the_book.title = params.fetch("query_title")
    the_book.description = params.fetch("query_description")
    the_book.released_at = params.fetch("query_released_at")
    the_book.popular = params.fetch("query_popular", false)

    if the_book.valid?
      the_book.save
      redirect_to("/books/#{the_book.id}", { :notice => "Book updated successfully."} )
    else
      redirect_to("/books/#{the_book.id}", { :alert => "Book failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_book = Book.where({ :id => the_id }).at(0)

    the_book.destroy

    redirect_to("/books", { :notice => "Book deleted successfully."} )
  end
end
