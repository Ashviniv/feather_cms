Rails.application.routes.draw do

  #mount Ckeditor::Engine => '/ckeditor'

  mount FeatherCms::Engine => "/feather_cms"
end
