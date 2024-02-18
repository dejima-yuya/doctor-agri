Rails.application.routes.draw do
  resources :trainings
  devise_for :users
  root 'surveys#new'
  resources :crops
  resources :categories
  resources :surveys do
    get 'analysis', on: :collection
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # メールの送信BOXを表示させるためのルーティング
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  #管理者用のルーティング
  namespace :admin do
    resources :users
  end  

end
