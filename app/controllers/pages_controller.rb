class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home]
	before_action :set_account, only: [:dashboard]
	before_action :set_groups, only: [:dashboard]

  def home
  	render layout: false
  end

  def dashboard
  	
  end
end
