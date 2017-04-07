Rails.application.routes.draw do

  devise_for :users
	#get'welcome/index'
   root'articles#index'
  
	resources :articles
    resources :blogs
	
  
  root'blogs#index'
 
  
  get'contactus' =>'home#contactus'
  get'aboutus' =>'home#aboutus'
  get'home' =>'home#home'

resources :articles do
  resources :comments
end

end

