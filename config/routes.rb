Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  root 'tasks#index'
end

# Prefix Verb   URI Pattern                  Controller#Action
#     tasks GET    /tasks(.:format)             tasks#index
#           POST   /tasks(.:format)             tasks#create
#  new_task GET    /tasks/new(.:format)         tasks#new
# edit_task GET    /tasks/:title/edit(.:format) tasks#edit
#      task GET    /tasks/:title(.:format)      tasks#show
#           PATCH  /tasks/:title(.:format)      tasks#update
#           PUT    /tasks/:title(.:format)      tasks#update
#           DELETE /tasks/:title(.:format)      tasks#destroy
