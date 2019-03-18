Rails.application.routes.draw do

   root 'application#index'

   resources :users

   post 'login' => 'sessions#create'
   delete 'logout' => 'sessions#destroy'

end
