Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "events#index"
  resources :events do
    get 'users', to: "users#index"
    post 'attend', to: "user_events#create"
    delete 'unattend', to: "user_events#destroy"
  end
end
