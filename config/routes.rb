Rails.application.routes.draw do

  root 'welcome#index'

  get 'about' => 'welcome#about'
  get 'welcome/faq' => 'welcome#faq'

  get 'fredslist' => 'advertisements#index'

  resources :posts
  resources :advertisements


end
