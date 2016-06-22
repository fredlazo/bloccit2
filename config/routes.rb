Rails.application.routes.draw do

  root 'welcome#index'

  get 'about' => 'welcome#about'
  get 'welcome/faq' => 'welcome#faq'

  resources :posts


end
