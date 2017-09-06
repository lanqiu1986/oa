Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  resources :his
  resources :mz_guahao1_his

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'his#index'

  namespace :admin do
    resources :posts do
      collection do
        get :search
      end
    end
    resources :categories
  end

  resources :posts do
    collection do
      get :search
    end
  end
end
