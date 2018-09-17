Rails.application.routes.draw do
	scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
		root 'skins#index'
		resources :skins do
			member do
				delete :delete_image_attachment
			end
		end
	    resources :types
	    resources :colors
	    resources :targets
	    resources :hardnesses
	    devise_for :users
		devise_scope :user do
			get 'admin', to: 'devise/sessions#new'
		end
		authenticated :user do
		  root 'skins#index', as: :authenticated_root
		end
	end
end
