Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'drawings#index'
  resources :drawings, only: [:create, :index]
  get 'cell_info/:grid_square_id', to: 'drawings#cell_info'
end
