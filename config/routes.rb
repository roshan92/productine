# Put all URLs behind an “api” namespace, and version our API “v1” (good practice).

Rails.application.routes.draw do
  apipie
  
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

  namespace :api do
    namespace :v1 do
      resources :products
    end
  end
end
