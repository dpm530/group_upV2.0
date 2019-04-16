Rails.application.routes.draw do

   root 'application#index'

   resources :users
   resources :groups

   resources :comments do
      collection do
         post ':id/user' => 'comments#create_comment'
      end
   end

   resources :discussions do
      collection do
         post ':id/user' => 'discussions#create_discussion'
      end
   end

   resources :attendances do
      collection do
         post ':id/user' => 'attendances#join_event'
         delete ':id/user' => 'attendances#leave_event'
      end
   end

   resources :members do
      collection do
         post ':id/user' => 'members#join_group'
         delete ':id/user' => 'members#leave_group'
      end
   end

   resources :events do
      collection do
         get 'new/:id' => 'events#new_event'
         post 'create/:id' => 'events#create_event'
      end
   end

   resources :sessions do
      collection do
         post 'login' => 'sessions#create'
         delete 'logout' => 'sessions#destroy'
      end
   end

end
