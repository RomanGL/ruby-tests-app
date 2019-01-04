Rails.application.routes.draw do
  get 'welcome/index'

  resources :quizzes do
    resources :questions do
      resources :answers
    end
  end

  root 'welcome#index'
end
