class UsersController < ApplicationController

  def dashboard
    #facebook login: https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
    
    @newts = current_user.newts.order(:updated_at).page params[:page]
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newts }
    end
  end
  
end