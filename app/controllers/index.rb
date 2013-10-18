get '/' do
  erb :index
end

get '/welcome/:user_id' do
  if current_user
    erb :welcome
  else
    redirect to '/'
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect to '/'
end

post '/signup' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect to '/welcome'
end

post '/login' do
  found_user = User.find_by_username(params[:username])

  if found_user && found_user.authenticate(params[:password])
    session[:user_id] = found_user.id
    redirect to "/welcome/#{current_user.id}"
  else
    redirect to '/'
  end
end



