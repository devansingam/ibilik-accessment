# Display new comment form

get '/biliks/:bilik_id/comments/new' do
  @bilik = Bilik.find(params[:bilik_id])
  erb :"comment/new"
end

# Create new comment

post '/comments' do
  comment =Comment.create(comment: params[:comment], bilik_id: params[:bilik_id], user_id: session[:user_id])
   redirect "/users/#{comment.user_id}"
end

# Display comment edit form


get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  erb :'comment/edit'
end 

# Update comment

patch '/comments/:id' do
  comment = Comment.find(params[:id])
  comment.update(comment: params[:comment], user_id: session[:user_id],)
  #redirect "/answers/#{answer.id}"
  redirect "/biliks/#{comment.bilik_id}"
end

# Delete comment

delete '/comments/:id' do
  comment = Comment.find(params[:id])
  comment.destroy
  redirect "/biliks/#{comment.bilik_id}"
end

# View comment profile

get '/answers/:id' do
  @comment = Comment.find(params[:id])
  erb :'comment/show'
end

get '/comments' do
  @comment = Comment.all
  erb :'comment/index'
end
