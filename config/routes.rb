Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'email#index'
  match '/email' => 'email#create', via: :get
  match '/email' => 'email#create', via: :post
end
