
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #Read 

  get '/' do 
  end

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
    Article.create(title: params[:title], content: params[:content])

    redirect '/articles/#{Article.last.id}'
  end

  #Update

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do 
    Article.update(params[:id], title: params[:title], content: params[:content])
    @article = Article.find(params[:id])
    erb :show
  end

  #Delete

  delete '/articles/:id' do 
    @article = Article.delete(params[:id])

    redirect '/articles'
  end


end
