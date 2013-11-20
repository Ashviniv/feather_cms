class FeatherCms::ApplicationController < ApplicationController
  if FeatherCms::Config.authentication.kind_of?(Hash)
    http_basic_authenticate_with FeatherCms::Config.authentication.merge(:except => :published)
  else
    before_filter FeatherCms::Config.authentication.to_sym, :except => :published
  end
end
