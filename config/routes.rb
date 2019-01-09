Rails.application.routes.draw do
  get 'error/not_found'
  get 'error/forbidden'
  get 'error/internal_server_error'
  match "/404", :to => "error#not_found", :via => :all
  match "/403", :to => "error#forbidden", :via => :all
  match "/500", :to => "error#internal_server_error", :via => :all
  devise_for :users, controllers: {registrations: 'users/registrations'}

  devise_scope :user do
    post 'users/sign_up', to: 'users/registrations#create'
    patch 'users/edit', to: 'users/registrations#update'
  end

  get 'welcome/index'

  resources :quizzes, only: [ :index, :new, :edit, :create, :update, :destroy ] do
    resources :questions, only: [ :index, :new, :edit, :create, :update, :destroy ] do
      resources :answers, only: [ :index, :new, :edit, :create, :update, :destroy ]
    end
  end

  root 'welcome#index'
end
