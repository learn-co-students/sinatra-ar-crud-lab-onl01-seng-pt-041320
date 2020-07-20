require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    #view
    erb :new
  end

  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles' do
    @articles = Article.all 
    #view
    erb :index
  end

  get '/articles/:id' do
    id = params[:id]
    @article = Article.find(id)
    #view
    erb :show
  end

  get '/articles/:id/edit' do
    id=params[:id]
    @article_edit = Article.find(id)
    #view
    erb :edit
  end

  patch '/articles/:id' do
    Article.update(params[:id], title: params[:title], content: params[:content])
    @article=Article.find(params[:id])
    #view
    erb :show
  end

  delete '/articles/:id' do
    Article.delete(params[:id])
    redirect '/articles'
  end

end