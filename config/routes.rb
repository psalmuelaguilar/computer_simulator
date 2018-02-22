Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :codes do
    collection do
      get :reset
      post :process_code
    end
  end
end
