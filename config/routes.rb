BusPlus::Application.routes.draw do
  
  resources :drivers, only: :index
  resources :vehicles, only: :index
  resources :passengers, only: :index
  resources :segments, only: :index
  
  scope '/api' do
    resources :drivers, only: [ :create, :destroy ]
    resources :vehicles, only: [ :create, :update, :destroy ]
    resources :passengers, only: [ :create, :update, :destroy ] do
      resources :segments, only: [ :create, :update, :destroy]
    end
  end

  root to: "home#index"
  
end
