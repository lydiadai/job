Rails.application.routes.draw do
  resources :jobs do
    resources :resumes
  end
  namespace :admin do
    resources :jobs do
      member do
        post :hide
        post :publish
      end
    end
  end
  root 'jobs#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
