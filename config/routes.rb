Rails.application.routes.draw do
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'playgroups', to: 'match#get_groups'
      get 'playround16', to: 'match#round_16'
      get 'playround8', to: 'match#round_8'
    end
  end

end
