Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/forbidden'
  get 'errors/internal_server_error'
  match "/404", :to => "errors#not_found", :via => :all
  match "/403", :to => "errors#forbidden", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  devise_for :users, controllers: {registrations: 'users/registrations'}

  devise_scope :user do
    post 'users/sign_up', to: 'users/registrations#create'
    patch 'users/edit', to: 'users/registrations#update'
  end

  get 'welcome/index'

  get 'quizzes/:id', :to => 'quizzes#perform', :as => 'perform_quiz'
  post 'quizzes/:id', :to => 'quizzes#finish'

  resources :quizzes, only: [ :index, :new, :edit, :create, :update, :destroy ] do
    resources :questions, only: [ :index, :new, :edit, :create, :update, :destroy ] do
      resources :answers, only: [ :index, :new, :edit, :create, :update, :destroy ]
    end
  end

  root 'welcome#index'
end
