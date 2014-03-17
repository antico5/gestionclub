Gestionclub::Application.routes.draw do
  #pagos
  post "pagos/create"
  post "pagos/delete"
  post "pagos/update"

  #caja
  get "caja/index"
  get "caja/cobrar_por_socio"
  get "caja/cobrar_a_socio/:socio_id" => "caja#cobrar_a_socio", as: :caja_cobrar_a_socio

  #redireccion basada en el rol de la cuenta
  get "web/redirigir"

  #devise
  devise_for :users, controllers: { sessions: "users/sessions" }

  #socios
  resources :socios

  #periodos
  resources :periodos
  get 'periodos/:id/generar_deuda' => 'periodos#generar_deuda', as: :generar_deuda

  #categorias
  resources :categorias

  #root
  root 'web#redirigir'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
