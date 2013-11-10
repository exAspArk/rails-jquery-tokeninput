Dummy::Application.routes.draw do
  root to: 'worlds#new'

  resource :worlds, only: :new do
    get :show_data, on: :collection
  end
end
