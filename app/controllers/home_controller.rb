class HomeController < ApplicationController
  def top
  end

  def about
    render :layout => "about_exposer"
  end
end
