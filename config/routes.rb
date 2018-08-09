Rails.application.routes.draw do
  
  devise_for :authors
  root to: 'blog/posts#index'  
 
  # /authors/posts 
  namespace :authors do
    resources :posts do
      put 'publish' => 'posts#publish', on: :member
      put 'unpublish' => 'posts#unpublish', on: :member
      
    end

  end

 resources :comments

  scope module: 'blog' do 
    get 'about' => 'pages#about', as: :about
    get 'contact' => 'pages#contact', as: :contact  
    get 'posts' => 'posts#index', as: :posts
    get 'post/:id' => 'posts#show', as: :post
    # get 'post/:id/comments' => 'comments#show', as: :comments
    # get 'post/:id/comments/new' => 'comments#new', as: :comments_new
    # post 'post/:id/comments' => 'comments#create', as: :create
    # delete 'post/:id/comments/:id' => 'comments#destroy', as: :comment_destroy
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
