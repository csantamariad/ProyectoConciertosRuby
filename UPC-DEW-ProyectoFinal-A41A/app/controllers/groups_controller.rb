class GroupsController < ApplicationController
  layout 'private'
  # GET /groups
  # GET /groups.json
  def index
    if current_user.user_type.isadmin
      @groups = Group.all
    else
      @groups = Group.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  def add_users
    @group = Group.find(params[:id])
    user_type_id =  UserType.select("id").where(:name => 'Alumno').first.id
    @users = User.where(:user_type_id => user_type_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    #where(:user_type_id => 2).
    @users = User.all()

    
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
    # initialize array (it is not saved in db)
    @group.selected_users_id=[]

    @group.users.each do |cur|
      @group.selected_users_id << cur.id
    end
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        # add users to relationship
        @group.selected_users_id.each do |user_id|
          if not user_id.blank?
            groupUser = GroupUser.new(:group_id => @group.id,:user_id => user_id)
            groupUser.save
          end
        end

        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])
    @group.selected_users_id = Group.new(params[:group]).selected_users_id
    Rails.logger.info "====================9 #{@group.selected_users_id}"

    respond_to do |format|
      if @group.update_attributes(params[:group])
        # delete all relation
        @group.group_users.delete_all
        # add new relations again
        @group.selected_users_id.each do |user_id|
          if not user_id.blank?
            groupUser = GroupUser.new(:group_id => @group.id,:user_id => user_id)
            groupUser.save
          end
        end

        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
end
