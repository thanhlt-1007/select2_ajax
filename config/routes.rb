Rails.application.routes.draw do
  root "home#index"
  resource :home, controller: :home do
    get :search
  end
end
