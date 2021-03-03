Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "questions#index"

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_up", :to => "users/registrations#new"
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    get "my_page/edit", :to => "users/registrations#edit"
  end

  resources :questions, :except => [:index], shallow: true do
    resources :answers, :except => [:index, :show]
  end

  resource :bookmarks, :only => [:create, :destroy]

  get "my_page", :to => "users#show"
  get "my_bookmark", :to => "questions#my_bookmark"
  get "my_question", :to => "questions#my_question"
  get "no_answer", :to => "questions#no_answer"
  get "search", :to => "questions#search"
  get "about", :to => "static_pages#about"

end
