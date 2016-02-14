class ApplicationController < ActionController::Base
  protect_from_forgery
  authem_for :user
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:page_slugs ) { Page.select(:slug).map(&:slug) }
  expose(:pages)
end
