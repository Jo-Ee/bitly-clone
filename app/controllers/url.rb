get '/' do 
  @urls = Url.all
  erb :'home'
end

post '/urls' do 
 @url = Url.new(long_url: params[:long_url])

  if @url.save
    return @url.to_json
  else
    @urls = Url.all
    @failed = true

    erb :'home'
  end

end


get '/urls' do
  redirect '/'
end


get '/all-links' do
  @links = Url.pluck(:id, :short_url, :long_url)
  @links.to_json
end

get '/:short_url' do 
  url = Url.find_by(short_url: params[:short_url])
  url.count
  redirect "#{url.long_url}"
end