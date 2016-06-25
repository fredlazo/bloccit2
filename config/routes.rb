Rails.application.routes.draw do

  root 'welcome#index'

  get 'about' => 'welcome#about'
  get 'welcome/faq' => 'welcome#faq'

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]
  post 'users/confrm' => 'users#confirm'

end
