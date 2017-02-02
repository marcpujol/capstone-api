Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    resources :states, only: [:index, :show]#except: [:new, :edit]
    resources :cities, only: [:index, :show]#except: [:new, :edit]
  end

  get '/ui' => 'ui#index'
  get '/ui#' => 'ui#index'
  root 'ui#index'
end
