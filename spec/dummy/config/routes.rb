Dummy::Application.routes.draw do
  root to: 'worlds#new'

  resource :worlds, only: [:new, :create, :show]
end
