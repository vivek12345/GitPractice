class UsersController < ApplicationController
	#before_filter :require_user,only:[:show,:edit,:destroy,:update]
	def show
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
  	@user_session=UserSession.new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save_without_session_maintenance
      @user.deliver_activation_instructions!
      flash[:success] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to :login
    else
      render :action => :new
    end
end
   
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = current_user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  def resend_activation
  if params[:email]
    @user = User.find_by_email(params[:email])
    if @user && !@user.active?
      @user.deliver_activation_instructions!
      flash[:notice] = "Please check your e-mail for your account activation instructions!"
      redirect_to :login
    end
  end
end

end
