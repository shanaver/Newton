class UsersController < ApplicationController

  def dashboard
    @newts = Newt.all
    #@newts = Newt.find_by_user_id(current_user.id)
    
    #facebook login: https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
    
    #@newts = User.find(current_user.id).get_newts
    
puts   "---------dashboard"
puts   @newts.inspect

    
    
    #@newts = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newts }
    end
  end
  
end