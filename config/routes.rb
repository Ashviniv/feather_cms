FeatherCms::Engine.routes.draw do

  get 'preview/:id' => 'pages#preview', :as => 'page_preview'
  mount Ckeditor::Engine => '/ckeditor'
  resources :pages

end
