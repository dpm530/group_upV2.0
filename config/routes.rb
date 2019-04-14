Rails.application.routes.draw do

   root 'application#index'

   resources :users
   resources :groups

   resources :events do
      collection do
         get 'events/new-group-event/:id' => 'events#new_event'
      end
   end

   resources :sessions do
      collection do
         post 'login' => 'sessions#create'
         delete 'logout' => 'sessions#destroy'
      end
   end

end
