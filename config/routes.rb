Rails.application.routes.draw do
  get 'welcome/index'

  resources :quizzes, only: [ :index, :new, :edit, :create, :update, :destroy ] do
    resources :questions, only: [ :index, :new, :edit, :create, :update, :destroy ] do
      resources :answers, only: [ :index, :new, :edit, :create, :update, :destroy ]
    end
  end

  root 'welcome#index'
end
