class ScanAcl::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :inner_menu_url, :context_menu_url, :inner_menu_tpl

  before_action :define_inner_menu

  def define_inner_menu; end

  def per_page; 15; end

  protected

  def inner_menu_url=(url)
    @_inner_menu_url = url
  end

  def context_menu_url=(url=nil)
    @_context_menu_url = url
  end

  def inner_menu_tpl=(tpl)
    @_inner_menu_tpl = tpl
  end

  def inner_menu_url
    @_inner_menu_url
  end

  def context_menu_url
    @_context_menu_url
  end

  def inner_menu_tpl
    @_inner_menu_tpl
  end

end
