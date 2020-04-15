class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data
    
    def index
        render json: @data
    end
    
    #Show a single book
    def show
        session[:books].each do |book|
            if book[:id] == params[:id]
                render json: book
            end
        end
    end
    
    #Create a new book
    def create
        id = params[:id]
        title = params[:title]
        author = params[:author]
        new_book = {id: id, title: title, author: author}
        session[:books].push(new_book)
        render json: new_book
     end
    
    #Update a book
    def update
        # respond back with the udpated book in json
        book_id = params[:id]
        book_price = params[:price]
        book = session[:books].find do |b|
            b[:id] == book_id
        end
        book[:price] = book_price
        render json: session[:books]
    end
    
    #Remove a book
    def destroy
        # respond back with the deleted book in json
        session[:books] = session[:books].select { |book|
            book["id"] != params[:id]
        }
        render json: session[:books]
    end
    
    private
    def setup_data
        session[:books] = [
            { id: "1", title: "Harry Potter", author: "J.K Rowling" },
            { id: "2", title: "Name of the wind", author: "Patrick Rothfuss" }
        ] unless session[:books]
    end
end