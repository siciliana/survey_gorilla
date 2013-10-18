get '/' do
  # Look in app/views/index.erb
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
