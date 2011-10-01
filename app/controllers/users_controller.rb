class UsersController < ApplicationController

  def dashboard
    #facebook login: https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newts }
    end
  end
  
end