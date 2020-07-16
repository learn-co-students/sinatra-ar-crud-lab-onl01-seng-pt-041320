
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do 
    # creates a new article from params from the form
    # redirects to the show page
    Article.create(params)
    redirect '/articles/3' # why wont #{id} work here?
  end

  get '/articles' do 
    # grab all articles and store into an instance variable
    # then render index erb to iterate thru and render on the page
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do 
    # This view should contain a form to update a specific article
    # fields should be pre-populated with existing title/content 
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do 
    # get id of original article
    # update original article with new params of edited article
    id = params[:id]
    new_params = {}
    original = Article.find(id)
    new_params[:title] = params[:title]
    new_params[:content] = params[:content]
    original.update(new_params)
    redirect '/articles/#{id}'
  end 


end
