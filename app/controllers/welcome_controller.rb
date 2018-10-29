class WelcomeController < ApplicationController
  def index
    flash[:notice] = "alibaba!"
  end
end
