Svdp::Application.routes.draw do
  resources :members
  resources :visits
  resources :people

  devise_for :users, :skip => :registrations
  resources :users

  root :to => "people#index"

end
