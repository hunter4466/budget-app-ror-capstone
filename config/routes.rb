Rails.application.routes.draw do
  get 'groups/show', to: "groups#show", as: "groups_show"
  get 'groups/new', to: "groups#new", as: "groups_new"
  get 'entities/show', to: "entities#show", as: "entities_show"
  get 'entities/new', to: "entities#new", as: "entities_new"
  devise_for :users
  root to: "recipes#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
