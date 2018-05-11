require 'rails_helper'
require 'byebug'
require 'spec_helper'
RSpec.describe "UsersController", type: :request do
	describe "GET /users" do
    	it "Load all the users data from User table" do
      		get "/users"
      		resp = expect(response).to be_successful #response.success
      		puts resp
    	end
    	it "Create user with correct params" do
    		get "/users/new"
    		post "/users", params: {:user => {name: "velusamy" , mail: "email@gmail.com", password: "password", phone: "23456789"}}
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "User was successfully created."
    	end

    	it "create an exception error" do
    		get "/users/new"
    		post "/users", params: {:user => {name: "velusamy" , mail: "email@gmail.com" ,password: "password", phone: "23456789"}}
    		# expect(flash[:status]).to eq "unprocessable_entity"
    	end


    	it "update user success method" do
    		user = User.create(name: "velusamy" , mail: "email@gmail.com", password: "password", phone: "23456789")
    		puts user.name
    		put "/users/#{user.id}", params: {:user => {name: "vetrivel"}}
    		
    		puts User.find(user.id).name
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "User was successfully updated."
    	end

    	# it "Update on not valid at given wrong input" do
    	# 	user = User.create(name: "velusamy" , mail: "email@gmail.com", password: "password", phone: "23456789")
    	# 	puts user.name
    	# 	put "/users/#{user.id}", params: {:user => {phone: "vetrivel"}}
    	# 	puts User.find(user.id).name
    	# 	resp = expect(response.status).to eq 302
    	# 	expect(flash[:notice]).to eq "unprocessable_entity"
    	# end
    	it "user delete success method0" do
    		user = User.create(name: "velusamy" , mail: "email@gmail.com", password: "password", phone: "23456789")
    		delete "/users/#{user.id}"
    		resp = expect(response.status).to eq 302
    		expect(flash[:notice]).to eq "User was successfully destroyed."
    	end
    	# it "user delete on error" do
    	# 	delete "/users/3"
    	# 	byebug
    	# 	resp = expect(response.status).to eq 302
    	# 	expect(flash[:notice]).to eq "User was successfully destroyed."
    	# end
    end

end