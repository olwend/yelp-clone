Rails.application.routes.draw do
	# devise_scope :user do
	# 	delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	# end
 	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  	root "restaurants#index"
  	resources :restaurants do
   	resources :reviews
   end
   get 'restaurants' => 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
