Rails.application.routes.draw do
  resources :kinds
  resources :contacts do

    # Kindモデルとのネストされたroutes(belongs_to)
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'

    # Phoneモデルとのネストされたroutes(has_many)
    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'

    # Addressモデルとのネストされたroutes(has_one)
    resource :address, only: [:show, :update, :create, :destroy]
    resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
