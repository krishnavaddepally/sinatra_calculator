require 'sinatra'
require 'sinatra/reloader'

configure :development, :test do
  require 'pry'
end

Dir[File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  erb :index
end

post '/calculate' do
  result = nil
  first_number = params[:first_number].to_i
  second_number = params[:second_number].to_i
  case params[:operation]
  when "+"
    result = first_number + second_number
  when "-"
    result = first_number - second_number
  when "*"
    result = first_number * second_number
  when "/"
    result = first_number / second_number
  else
    result = nil
  end
  erb :index, locals: { result: result }
end
