class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data
    
    def index
        render json: @data
    end
    
    #Show a single book
    def show
        #repond back with the book in json
    end
    
    #Create a new book
    def create
        #respond back with the created book in json
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