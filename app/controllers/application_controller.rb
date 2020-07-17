
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #Read 

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end

  #Create

  get '/articles/new' do 
    erb :new
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])

    redirect '/articles/#{article.id}'
  end
end
