require 'rails_helper'
require 'byebug'
require 'spec_helper'
RSpec.describe "CartsController", type: :request do
	describe "GET /carts" do
    	it "Load all the carts data from Cart table" do
      		get "/carts"
      		resp = expect(response).to be_successful #response.success
      		puts resp
    	end
    	it "Create cart with correct params" do
    		get "/carts/new"
            user = User.create!
            product = Product.create!
    		post "/carts", params: {:cart => {product_id: product.id, user_id: user.id}}
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "Cart was successfully created."
    	end

    	it "create an exception error" do
    		get "/carts/new"
    		user = User.create!
            product = Product.create!
            post "/carts", params: {:cart => {product_id: "vbvcb", user_id: user.id}}
            puts flash[:status]
    		# expect(flash[:status]).to eq "unprocessable_entity"
    	end


    	it "update cart success method" do
            user = User.create!
            product = Product.create!
    		cart = Cart.create(product_id: product.id, user_id: user.id)
    		puts cart
    		put "/carts/#{cart.id}", params: {:cart => {name: "vetrivel"}}
    		
    		puts Cart.find(cart.id)
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "Cart was successfully updated."
    	end

    	it "Update on not valid at given wrong input" do
    		user = User.create!
            product = Product.create!
            cart = Cart.create(product_id: product.id, user_id: user.id)
    		puts cart
    		put "/carts/#{cart.id}", params: {:cart => {user_id: user.id + 2}}

    		puts Cart.find(cart.id)
    		# resp = expect(response.status).to eq 302
    		# expect(flash[:notice]).to eq "unprocessable_entity"
    	end
    	it "Cart delete success method0" do
            user = User.create!
            product = Product.create!
    		cart = Cart.create(product_id: product.id, user_id: user.id)
    		delete "/carts/#{cart.id}"
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "Cart was successfully destroyed."
    	end
    end

end