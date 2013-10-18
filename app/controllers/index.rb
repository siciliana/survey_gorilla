get '/' do
  # if session[:user_id] != nil
  #   @user = User.find_by_id(session[:user_id])
  #   redirect to "/welcome/#{current_user.id}"
  # end
  erb :index
end



post '/signup' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect to '/welcome'
end

get '/welcome/:user_id' do
  erb :welcome
end

post '/login' do
  @user = User.find_by_username(params[:username])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect to "/welcome/#{current_user.id}"
  else
    redirect to '/'
  end
end
