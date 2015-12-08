# Display new bilik form

get '/biliks/new' do
  erb :"bilik/new"
end

# Create new bilik

post '/biliks' do
  bilik = Bilik.create(description: params[:description],price: params[:price],address: params[:address], city: params[:city],state: params[:state], user_id: session[:user_id])
  redirect "/users/#{bilik.user_id}"
end

# Display bilik edit form

get '/biliks/:id/edit' do
  @bilik = Bilik.find(params[:id])
  erb :'bilik/edit'
end 

# Update bilik

patch '/biliks/:id' do
  bilik = Bilik.find(params[:id])
  bilik.update(bilik: params[:bilik], user_id: session[:user_id],)
  redirect "/biliks/#{bilik.id}"
end

# Delete bilik

delete '/biliks/:id' do
  bilik = Bilik.find(params[:id])
  bilik.destroy
  redirect "/users/#{bilik.user_id}"
end

# View bilik profile

get '/biliks/:id' do
  @bilik = Bilik.find(params[:id])
  erb :'bilik/show'
end

get '/' do
  @biliks = Bilik.all
  #@answers = Answer.all
  erb :'static/index'
end

