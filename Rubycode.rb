require 'sinatra'
# Code for functions (out of the scope of the exercise):
# valid_session, show_login_page, validate_credentias and new_session_id
get '/' do
'Hello world!' if valid_session(params[:session])
show_login_page(params[:session]) if !valid_session(params[:session])
end
post '/login' do
session_id = new_session_id() if !params.key?("session")
session_id = params[:session] if params.key?("session")
show_login_page(params[:session]) if !validate_credentials(params)
redirect "/?session=” + session_id if validate_credentials(params)
end