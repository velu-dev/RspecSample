require 'rails_helper'
require 'byebug'
require 'spec_helper'
RSpec.describe "ProductsController", type: :request do
	describe "GET /products" do
    	it "Load all the products data from product table" do
      		get "/products"
      		resp = expect(response).to be_successful #response.success
      		puts resp
    	end
    	it "Create product with correct params" do
    		get "/products/new"
    		post "/products", params: {:product => {name: "velusamy", price: "fds"}}
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "Product was successfully created."
    	end

    	it "create an exception error" do
    		get "/products/new"
    		post "/products", params: {:product => {name: "product 1" , price: "123"}}
    		# expect(flash[:status]).to eq "unprocessable_entity"
    	end


    	it "update product success method" do
    		product = Product.create(name: "product 1", price:"122")
    		puts product.name
    		put "/products/#{product.id}", params: {:product => {name: "vetrivel"}}
    		puts Product.find(product.id).name
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "Product was successfully updated."
    	end

    	# it "Update on not valid at given wrong input" do
    	# 	product = Product.create(name: "product")
    	# 	puts product.name
    	# 	put "/products/#{product.id}", params: {:product => {phone: "vetrivel"}}
    	# 	puts Product.find(product.id).name
    	# 	resp = expect(response.status).to eq 302
    	# 	expect(flash[:notice]).to eq "unprocessable_entity"
    	# end
    	it "product delete success method0" do
    		product = Product.create(name: "velusamy" ,price: "12")
    		delete "/products/#{product.id}"
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "Product was successfully destroyed."
    	end
    	# it "product delete on error" do
    	# 	delete "/products/3"
    	# 	byebug
    	# 	resp = expect(response.status).to eq 302
    	# 	expect(flash[:notice]).to eq "Product was successfully destroyed."
    	# end
    end

end