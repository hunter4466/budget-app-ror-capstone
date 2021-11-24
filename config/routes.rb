Rails.application.routes.draw do
  get 'splash/show', to: "splash#show", as: "splash_show"
  get 'groups/show', to: "groups#show", as: "groups_show"
  get 'groups/new', to: "groups#new", as: "groups_new"
  get 'entities/show/:cat_id', to: "entities#show", as: "entities_show"
  get 'entities/new/:prev_data/:prev_data_two/:prev_data_three', to: "entities#new", as: "entities_new"
  post 'groups/new', to: "groups#create", as: "user_create_group"
  post 'entities/new/:cat_id', to: "entities#create", as: "user_create_entities"
  devise_for :users
  root to: "splash#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
