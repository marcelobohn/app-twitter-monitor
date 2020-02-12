Rails.application.routes.draw do
  # get 'search/index'
  get 'search/:term' => 'search#index', as: :friendly_search
  resources :hashtags
  root 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
