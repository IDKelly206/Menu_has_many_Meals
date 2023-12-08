Rails.application.routes.draw do
  root to: "pages#home"

  resources :households, only: [:show]

  devise_for :users, :path_prefix => 'auth'
  resources :users, except: [:index]


  resources :menus, only: [:index, :show, :new] do
    resources :meals, only: [:index, :show] do
      resources :courses, only: [:new, :create, :show, :edit, :update, :destroy] do
      end
    end
  end

  resources :menus, only: [:show] do
    member do
      get '/:meal_type', to: 'menus#show_meal', as: 'show_meal'
    end
  end



  #  To be removed - used as testing for modal and multi-obj creation
  resources :meals, only: [:new, :create] do
    collection do
      get 'meal_new'
    end
  end


  resources :recipes, only: [:index, :show, :new] do
    collection do
      get 'recipe_search'
    end
  end

  resources :products, only: [:index]

  resources :groceries


end
