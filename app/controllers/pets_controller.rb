class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    @pet = Pet.create(name: params[:pet][:name]) if !params[:pet][:name].empty?
    if !params[:pet][:owner_ids].nil?
      @pet.owner = Owner.find(params[:pet][:owner_ids]).first
      @pet.save
    end
    # @pet.create_owner(name: params[:pet][:owner]) if !params[:pet][:owner].empty?
    if !params[:pet][:owner].empty?
      redirect to "pets/#{@pet.id}"
    end
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end