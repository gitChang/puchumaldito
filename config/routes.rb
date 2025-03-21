Rails.application.routes.draw do
  
  root  'posts#index'
  get   '/:title'               => 'posts#show',         as: 'detailed'
  get   '/categorize/:category' => 'posts#categorize',   as: 'categorize'

  scope '/api' do
    resources :posts, only: [], defaults: { format: 'json' } do
    	collection do
    		get 'search'
    	end
    end
  end

end
