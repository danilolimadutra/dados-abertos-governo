Rails.application.routes.draw do
  get 'sobre', to: 'pages#sobre'
  root 'pages#sobre'

  resources :deputados do
    collection do
      get :listar
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
