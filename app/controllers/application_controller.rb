
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
    end
  
    get '/' do

    end

    get '/articles/new' do
      @articles = Articles.all
      #redirects to '/articles/:id'
      
      erb :index
    end


    get 'articles/:id' do
      @articles = Article.find(params[:id])
     
      erb :show
    end
    
  end