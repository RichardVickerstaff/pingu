Rails.application.routes.draw do

     resources :sites, only: [:index], defaults: {format: 'json'}

end
