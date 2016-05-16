Rails.application.routes.draw do
  resources :learnings_students

  resources :learnings

  get 'welcome/index'
  get 'projects/index/differences' => 'projects#differences', as: :project_differences
  get 'assignments/:id/get_groups' => 'assignments#get_groups', as: :groups_assignment
  get 'projects/:id/get_groups' => 'projects#get_groups', as: :groups_project
  get 'teams/:id/students' => 'teams#get_students', as: :students_group
  get 'teams/index/differences' => 'teams#differences', as: :team_differences
  get 'assignments/index/differences' => 'assignments#differences', as: :assignment_differences
  get 'projects/:id/students' => 'projects#get_students', as: :students_project
  get 'assignments/:id/students' => 'assignments#get_students', as: :students_assignments
  get 'learnings/index/differences' => 'learnings#differences', as: :learning_differences
  get 'learnings/:id/students' => 'learnings#get_students', as: :students_learning

  resources :students_tasks

  resources :teams_projects

  resources :teams_assignments

  resources :reports

  resources :teachers

  resources :students

  resources :teams

  resources :tasks

  resources :assignments

  resources :projects

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
