Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  delete '/plots/:plot_id/:plant_id', to: 'plant_plots#destroy'

  resources :plots, only: [:index] do
  end

end
