Rails.application.routes.draw do
  get '/studios', to: 'studios#index'
  get '/actors/:id', to: 'actors#show'
end
