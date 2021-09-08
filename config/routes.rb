Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      resources :users
      resources :programs
      get '/user-programs/:id', to: 'users#programs'
      get '/search-program/:term', to: 'programs#search'

    end
  end
end
