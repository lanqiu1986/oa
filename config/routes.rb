Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  namespace :admin do
    resources :posts
    resources :categories
  end

  resources :posts do
    collection do
      get :search
    end
  end
end
