Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index' #show.html.erbに繋げる
  resources :items, only: [:index, :new, :create, :show]

end
