Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/slugs' => 'slugs#index'
      post '/slugs/create' => 'slugs#create'
      delete '/slugs/delete' => 'slugs#delete'
      get '/slugs/:slug' => 'slugs#get_by_slug'
    end
  end

  get '/(:slug)' => 'slugs#index'
  resources :slugs, only: [:index, :new]
end
