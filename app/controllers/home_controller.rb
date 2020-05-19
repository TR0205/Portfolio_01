class HomeController < ApplicationController
  def top
  end

  def about
    render :layout => nil
  end
end
