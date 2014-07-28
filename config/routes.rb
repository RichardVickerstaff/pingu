Rails.application.routes.draw do
  scope module: :v1 do
    resources :sites, only: [:index], defaults: {format: 'json'}
  end
end

__END__

By convention we want the new version to de the default API
The fowliing shows how this can be done:

scope module: :v1, constraints: ApiConstraint.new(version: 1) do
  resources :sites, only: [:index], defaults: {format: 'json'}
end

scope module: :v2 do
  resources :sites, only: [:index], defaults: {format: 'json'}
end

http://www.bignerdranch.com/blog/adding-versions-rails-api/
