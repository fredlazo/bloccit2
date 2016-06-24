Rails.application.routes.draw do

  root 'welcome#index'

  get 'about' => 'welcome#about'
  get 'welcome/faq' => 'welcome#faq'

  resources :topics do
    resources :posts, except: [:index]
  end

end
