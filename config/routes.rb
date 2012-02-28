BusPlus::Application.routes.draw do
  
  resources :drivers, only: :index
  resources :vehicles, only: :index
  resources :passengers, only: :index
  resources :destinations, only: :index
  
  scope '/api' do
    resources :drivers, only: [ :create, :show, :update, :destroy ]
    resources :vehicles, only: [ :create, :show, :update, :destroy ]
    resources :passengers, only: [ :create, :show, :update, :destroy ] do
      resource :destination, only: :create
    end
    match '/:anything' => 'api/base#error', conditions: { anything: /.*/ }
  end

  match "/match" => "home#match", via: :get
  root to: "home#index"

end
