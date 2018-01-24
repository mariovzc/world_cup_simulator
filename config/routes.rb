Rails.application.routes.draw do
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'playgroups', to: 'match#get_groups'
      get 'playround16', to: 'match#round_16'
      get 'playround8', to: 'match#round_8'
      get 'playround4', to: 'match#round_4'
      get 'playthirdplace', to: 'match#round_2_losers'
      get 'playfinal', to: 'match#round_final'
      post 'create_matches', to: 'match#play_world_cup'
      delete 'restart', to: 'match#restar_world_cup'
    end
  end

end
