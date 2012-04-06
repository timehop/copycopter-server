Copycopter::Application.routes.draw do
  namespace :api do
    namespace :v2 do
      resources :projects, :only => [] do
        resources :deploys, :only => [:create]
        resources :draft_blurbs, :only => [:create, :index]
        resources :published_blurbs, :only => [:index]
        resources :blurbs, :only => [:show], :format => false, :constraints => { :id => /[0-9A-Za-z_\-\.]+/ }
      end
    end
  end

  resources :projects, :only => [:index, :show] do
    resources :blurbs, :only => [:destroy]
    resources :locales, :only => [:new]
  end

  resources :localizations, :only => [] do
    resources :versions, :only => [:new, :create]
  end

  root :to => 'projects#index'
end
