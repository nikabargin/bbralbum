Rails.application.routes.draw do
    devise_for :admins
    resources :leathers, path: 'catalog' do
    	collection do
    		patch :sort
    	end
    	member do
    		delete :delete_image_attachment
    	end
    end
    root to: 'leathers#index'
    devise_scope :admin do
      get 'admin', to: 'devise/sessions#new'
      get 'new_admin', to: 'devise/registrations#new'
      get 'kill_admin', to: 'devise/sessions#destroy'
    end
end
