Rails.application.routes.draw do
  resources :mining_types
  resources :personals
  resources :coins
  
  #para fazer rotas manuais
  #get '/moedas', to: 'coins#index'

  root to: 'welcome#index'

  delete 'coins/:id(.:format)', :to => 'coins#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
