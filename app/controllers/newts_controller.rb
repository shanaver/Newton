class NewtsController < ApplicationController

  def index
    @newts = Newt.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newts }
    end
  end

  def show
    @newt = Newt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newt }
    end
  end
  
  def remote
    @newt = Newt.find_by_uniq_id(params[:id])

    respond_to do |format|
      format.json  { render :json =>  @newt.newt.to_json, :callback => params[:callback] }
    end
  end

  def new
    @newt = Newt.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newt }
    end
  end

  def edit
    @newt = Newt.find_by_uniq_id(params[:id])
    usernewt = UserNewt.find_by_newt_id(@newt.id)
    @user = User.find(usernewt.user_id)
  end

  def create
    @newt = Newt.new(params[:newt])
    
    user = User.find_by_email(params[:user][:email])
    if user.blank?
      user = User.create_temprary_account(params[:user])
    end
    
    respond_to do |format|
      if @newt.save
        usernewt = UserNewt.new(:user_id => user.id, :newt_id => @newt.id).save
        format.html { redirect_to(@newt, :notice => 'Newt was successfully created.') }
        format.xml  { render :xml => @newt, :status => :created, :location => @newt }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newt.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @newt = Newt.find(params[:id])

    respond_to do |format|
      if @newt.update_attributes(params[:newt])
        format.html { redirect_to(@newt, :notice => 'Newt was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newt.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @newt = Newt.find(params[:id])
    @newt.destroy

    respond_to do |format|
      format.html { redirect_to(newts_url) }
      format.xml  { head :ok }
    end
  end
end
