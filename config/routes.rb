Rails.application.routes.draw do
  resources :bloggers, only:[:show, :new, :create]
  resources :destinations, only:[:show]
  resources :posts, only:[:show, :new, :create, :edit, :update]
  patch '/posts/:id/add_likes', to: 'posts#add_likes', as: 'add_likes'
end
