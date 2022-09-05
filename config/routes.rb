Rails.application.routes.draw do
  #authenticated :user do
  #  root :to => "tasks#index"
  #end
  
  root 'tasks#top'
  
  get "/about" => "tasks#about", as: "about"

  devise_for :users#, :controllers => {:registrations => 'users/registrations'}
  
  resources :tasks, only: [:top, :about, :index, :new, :create, :edit, :update, :change, :complete_tasks] do
    member do
      patch "/complete" => "tasks#change", as: "change"
      delete "/" => "tasks#destroy", as: "delete"
    end
    
  #   collection do
  #     get "/complete" => "tasks#complete", as: "complete"
  #     get "/today" => "tasks#today", as: "today"
  #   end
  end
  
  resources :users, only: [:edit, :update, :index, :show]

  # resources :relationships, only: [:create, :destroy]
  # get 'users/followings'
  # get 'users/followers'

end