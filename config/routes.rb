Rails.application.routes.draw do
  get 'welcome/index'

  resources :quizzes

  root 'welcome#index'
end
