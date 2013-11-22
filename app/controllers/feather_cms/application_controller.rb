class FeatherCms::ApplicationController < ApplicationController
  if FeatherCms::Config.authentication.kind_of?(Hash)
    http_basic_authenticate_with FeatherCms::Config.authentication.merge(:except => :published)
  else
    before_filter FeatherCms::Config.authentication.to_sym
    before_filter :only_admin, except: :show
  end

  def only_admin
    redirect_to root_url unless current_user.admin?
  end
end
