require 'sinatra'

birth_path_num = Person.get_birth_path_num(birthdate)

message = Person.get_message(birth_path_num)

valid_birthdate = Person.valid_birthdate(input)

get '/message/:birth_path_num' do
  birth_path_num = params[:birth_path_num].to_i
  @message = get_message(birth_path_num)
  erb :index
end

get '/' do
  erb :form
end

post '/' do
  birthdate = params[:birthdate].gsub("-", "")
  if valid_birthdate(birthdate)
    birth_path_num = get_birth_path_num(params[:birthdate])
    redirect "/message/#{birth_path_num}"
  else
    @error = "Your input wasn't valid, try again using MMDDYYY format!"
    erb :form
  end
end