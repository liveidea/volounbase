class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_locale
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
  protect_from_forgery with: :exception
end
