require 'rails_helper'
require 'byebug'
require 'spec_helper'
RSpec.describe "OrdersController", type: :request do
	describe "GET /orders" do
    	it "Load all the orders data from Order table" do
      		get "/orders"
      		resp = expect(response).to be_successful #response.success
      		puts resp
    	end
    	it "Create order with correct params" do
    		get "/orders/new"
            user = User.create!
            product = Product.create!
    		post "/orders", params: {:order => {product_id: product.id, user_id: user.id}}
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "Order was successfully created."
    	end

    	it "create an exception error" do
    		get "/orders/new"
    		user = User.create!
            product = Product.create!
            post "/orders", params: {:order => {product_id: "vbvcb", user_id: user.id}}
            puts flash[:status]
    		# expect(flash[:status]).to eq "unprocessable_entity"
    	end


    	it "update order success method" do
            user = User.create!
            product = Product.create!
    		order = Order.create(product_id: product.id, user_id: user.id)
    		puts order
    		put "/orders/#{order.id}", params: {:order => {name: "vetrivel"}}
    		
    		puts Order.find(order.id)
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "Order was successfully updated."
    	end

    	it "Update on not valid at given wrong input" do
    		user = User.create!
            product = Product.create!
            order = Order.create(product_id: product.id, user_id: user.id)
    		puts order
    		put "/orders/#{order.id}", params: {:order => {user_id: user.id + 2}}

    		puts Order.find(order.id)
    		# resp = expect(response.status).to eq 302
    		# expect(flash[:notice]).to eq "unprocessable_entity"
    	end
    	it "order delete success method0" do
            user = User.create!
            product = Product.create!
    		order = Order.create(product_id: product.id, user_id: user.id)
    		delete "/orders/#{order.id}"
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "Order was successfully destroyed."
    	end
    	# it "Order delete on error" do
    	# 	delete "/orders/3"
    	# 	resp = expect(response.status).to eq 302
    	# 	expect(flash[:notice]).to eq "Order was successfully destroyed."
    	# end
    end

end