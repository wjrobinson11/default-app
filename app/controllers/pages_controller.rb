class PagesController < ApplicationController
	skip_before_action :authenticate_user!

  def home
  	render layout: false
  end
end
