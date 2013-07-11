Svdp::Application.routes.draw do
  scope ':username' do
    root to: "searches#index"
    resources :searches, param: 'term'

    resources :addresses

    resources :families
    resources :visits
    resources :people
    resources :users

  end

  devise_for :users, :skip => :registrations

  root to: "searches#index", as: :search_page

end
