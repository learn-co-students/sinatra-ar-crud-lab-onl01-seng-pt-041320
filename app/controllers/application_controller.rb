
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
    Article.create(params)

    redirect '/articles/#{@article.id}'
  end

  #Update

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end

  patch 'articles/:id' do 
    id = params[:id]
    new_params = {}

    orig = Article.find(id)
    new_params[:title] = params[:title]
    new_params[:content] = params[:content]

    orig.update(new_params)
    
    redirect '/articles/#{id}'
  end



end
