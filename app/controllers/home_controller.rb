class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}

  def top
  end

  def about
    render :layout => "about_exposer"
  end
end
