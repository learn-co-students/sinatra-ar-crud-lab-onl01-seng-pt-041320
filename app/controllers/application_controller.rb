
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #Read 

  get '/articles' do
    @article = Article.all
    erb :index
  end

  get '/articles/:id' do 
    #@article = Article.find(params[:id])
    erb :show
  end

  #Create

  get '/articles/new' do 
    erb :new
  end

  post '/articles' do 
    Article.create(params[:id])
  end
end
