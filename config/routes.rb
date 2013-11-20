#FeatherCms::Engine.routes.draw do
Rails.application.routes.draw do
  namespace :feather_cms, path: FeatherCms::Config.namespace do
    get 'preview/:id' => 'pages#preview', :as => 'page_preview'
    mount Ckeditor::Engine => '/ckeditor'
    post 'rebuild' => 'pages#rebuild'
    resources :pages
    resources :sections
    resources :categories
  end
end
