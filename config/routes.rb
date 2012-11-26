BusPlus::Application.routes.draw do
  
  resources :drivers, only: :index
  resources :vehicles, only: :index
  resources :passengers, only: :index
  resources :candidates, only: :index
  
  scope '/api' do
    resources :drivers
    resources :vehicles
    resources :passengers
    resources :candidates
    match '/:anything' => 'api/base#error', conditions: { anything: /.*/ }
  end

  match "/match" => "home#match", via: :get
  root to: "home#index"

end
