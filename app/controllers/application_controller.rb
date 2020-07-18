
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do

    erb :new

    # binding.pry
  end

  post '/articles' do
    # binding.pry
    article = Article.create(params)
    # article.save
    # binding.pry
    redirect "articles/#{article.id}"
  end

  get '/articles/:id' do
    # binding.pry
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    params.delete(:_method)
    @article = Article.find_by_id(params[:id])
    @article.update(params)
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.destroy
    redirect "/articles"
  end
  
end
