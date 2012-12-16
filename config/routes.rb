BusPlus::Application.routes.draw do
  
  resources :drivers, only: :index
  resources :vehicles, only: :index
  resources :passengers, only: :index
  resources :candidates, only: :index
  
  scope '/api' do
    resources :drivers
    resources :vehicles do
      collection do
        get :near
      end
    end
    resources :passengers
    resources :candidates
    match '/:anything' => 'api/base#error', conditions: { anything: /.*/ }
  end

  match "/api/match" => "api#match", via: :get, as: 'match'
  match "/api" => 'api#index', via: :get, as: 'api'
  match "/passenger" => 'home#passenger', via: :get, as: 'passenger'
  match "/driver" => 'home#driver', via: :get, as: 'driver'
  root to: "home#index"

end
