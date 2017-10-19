get '/sessions/new' do
  erb :"sessions/login"
end

post '/sessions' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    #need to redirect to a separate page
    #redirect
  else
    @error = "Invalid login, try again"
    erb :"sessions/new"
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end
