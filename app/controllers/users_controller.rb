class UsersController < ApplicationController

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
    
    @course = Course.find(params[:course_id]) if params[:course_id]
    
    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end  
    end
  

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @user.assign_attributes(params[:admin], :as => :admin)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @course = Course.find(params[:course_id]) if params[:course_id]

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        current_user = @user
        @user.registrations.create(course: @course) if @course
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html do
          render action: "new" 
        end
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
end
