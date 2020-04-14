class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data
    
    def index
        render json: @data
    end
    
    #Show a single book
    def show
        book_to_return = {}
        for book in @data
            if book[:id] == params[:id]
                book_to_return = book
            end
        end
        render json: book_to_return
    end
    
    #Create a new book
    def create
        name = params[:name]
        price = params[:price]
        new_book = {name: name, price: price}
        @data.push(new_book)
        render json: new_book
    end
    
    #Update a book
    def update
        # respond back with the udpated book in json
    end
    
    #Remove a book
    def destroy
        # respond back with the deleted book in json
    end
    
    private
    def setup_data
        @data = [
            { id: "1", title: "Harry Potter", author: "J.K Rowling" },
            { id: "2", title: "Name of the wind", author: "Patrick Rothfuss" }
        ]
    end
end