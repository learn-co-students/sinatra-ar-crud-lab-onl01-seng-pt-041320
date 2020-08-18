
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
  end

  get '/articles' do #index action
    @articles = Article.all

    erb :index
  end

  get '/articles/new' do #new action
    erb :new
  end

  post '/articles' do # new action
    @article = Article.create(title: params[:title],content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do #show action
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do  #load edit form
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do #edit action
    @article = Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id/delete' do #delete action
    @article = Article.find(params[:id])
    @article.delete
    erb :deleted
  end

end
