Rails.application.routes.draw do

  root "dashboard#index"

  get  "/dashboard/last_six_months", to: "dashboard#last_six_months"
  get  "/dashboard/by_today", to: "dashboard#by_today"
  get  "/dashboard/by_category", to: "dashboard#by_category"
  get  "/dashboard/acum", to: "dashboard#acum"

  resources :expenses

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :expenses, only: [:index, :create, :update, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
