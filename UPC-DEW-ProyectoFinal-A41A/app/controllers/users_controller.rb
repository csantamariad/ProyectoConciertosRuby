class UsersController < ApplicationController
  layout 'private'


  def alumno
    @user = current_user
    @user.documentnumber = @user.documenttype == 'DNI' ? '': @user.documentnumber
  end

  def alumno_change
    @user = current_user
    @user.update_attribute('documenttype' , 'TUI')
    @user.update_attribute('user_type_id' , '2')
    if (@user.update_attribute('documentnumber' , params[:user][:documentnumber]))
      @notice = 'Se actualizo tu nivel de acceso ahora eres Alumno'
    else
      @notice = 'Error: No Se actualizo tu nivel de acceso'
    end

    redirect_to alumno_root_url , :notice => @notice

  end

  def email_change
    @user = current_user

    if (@user.update_attribute('email' , params[:user][:email]))
      @notice = 'Se actualizo el email con exito...'
    else
      @notice = 'Error: No Se actualizo el email...'
    end

    redirect_to email_root_url , :notice => @notice

  end

  def email
    @user = current_user
    @user.email = ''
  end

  def password_change
    @user = current_user

    if (params[:user][:password] == params[:user][:password_confirmation])
      @user.update_attribute('password' , params[:user][:password])
      @user.update_attribute('password_confirmation' , params[:user][:password_confirmation])
      @notice = 'Se actualizo el password con exito...'
    end

    if (params[:user][:password] != params[:user][:password_confirmation])
      @notice = 'Error: password no son iguales...'
    end

    redirect_to password_root_url , :notice => @notice

  end

  def password
    @user = current_user
  end

  def setting

    @user = current_user

    if (@user.twitter)
      @user.gender=""
      @user.lastname1=""
      @user.lastname2=""
      @user.documentnumber=""
    end

    respond_to do |format|
      format.html # setting.html.erb
    end
  end

  def setting_edit

    if User.update_user(params[:user])
      redirect_to setting_url
    end

  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def register_user

    @user = User.new

    respond_to do |format|
      format.html  {render :layout => 'application'}# index.html.erb
    end
  end

  def login
    Rails.logger.info "=================> Trying to login."
    @user = User.new(params[:user])
    count = User.where(:email => @user.email, :password => @user.password).count()

    if count == 1
      session[:user_id] = User.where(:email => @user.email).first.id
      session[:loggeduser] = User.where(:email => @user.email).first
      redirect_to setting_url
    else
      redirect_to "/public/enter", :notice => "Usuario/Clave Incorrectos. "
    end
  end

  def logout
      session[:loggeduser] = nil
      redirect_to "/"
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if (@user.documenttype == 'DNI')
      @user.user_type_id = 3 # Usuario
    elsif (@user.documenttype == 'TUI')
      @user.user_type_id = 2 # Alumno
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

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
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
