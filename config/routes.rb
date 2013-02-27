Dashboard::Application.routes.draw do
  get "dashboard/index"
  get "dashboard/lists"
  get "dashboard/wiki"

  root :to => 'dashboard#index'
end
