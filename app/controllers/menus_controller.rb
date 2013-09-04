class MenusController < ApplicationController
#skip_before_filter :authorize

  def index

#    @user = User.find(:all, :conditions => { :user_id => session[:user_id] })

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
end
