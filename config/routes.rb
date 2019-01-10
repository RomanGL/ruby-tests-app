Rails.application.routes.draw do
  get 'quiz_performs/index'
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

  resources :quizzes, only: [ :index, :new, :edit, :create, :update, :destroy ] do
    resources :questions, only: [ :index, :new, :edit, :create, :update, :destroy ] do
      resources :answers, only: [ :index, :new, :edit, :create, :update, :destroy ]
    end
  end

  scope '/quiz_performs' do
    get '/:quiz_id', :to => 'quiz_performs#index', as: 'quiz_performs'
    get '/:quiz_id/new', :to => 'quiz_performs#new', as: 'new_quiz_perform'
    get '/:quiz_id/:perform_id', :to => 'quiz_performs#show', as: 'show_quiz_perform'
    post '/:quiz_id', :to => 'quiz_performs#create'
    delete '/:quiz_id', :to => 'quiz_performs#destroy'
  end

  root 'welcome#index'
end
