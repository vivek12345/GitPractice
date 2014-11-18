class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end
 
  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])
  if @user_session.save
      redirect_to projects_path
    elsif @user_session.attempted_record &&
    !@user_session.invalid_password? &&
    !@user_session.attempted_record.active?
    flash[:info]="Sorry, before you can sign in you need to confirm your email address"
    render(:new,:locals => { :user => @user_session.attempted_record })
    #render(:partial => 'user_sessions/not_active.html.erb', :locals => { :user => @user_session.attempted_record })
    
  else
    render :action => :new
  end
  end
 
  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
 
    respond_to do |format|
      format.html { redirect_to(root_url, :notice => 'Goodbye!') }
      format.xml  { head :ok }
    end
  end
end
  

