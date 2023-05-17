require 'sinatra'
require 'json'
require 'net/http'
require 'rerun'

set :public_folder, File.join(File.dirname(__FILE__), 'public')

get '/' do
  uri = URI('https://api.buttercms.com/v2/pages/*/porpi-page/?auth_token=b6ac3b117c77cfb2dbddd09a8529fc1375aaf865') # Replace with your API endpoint
  response = Net::HTTP.get(uri)
  data = JSON.parse(response)

  # Render the data in an HTML template

  erb :index, locals: { data: data['data']['fields']}

end






