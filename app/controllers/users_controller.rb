class UsersController < ApplicationController
  skip_before_filter :check_logged_in

  before_filter :logged_in_user, only: [:edit, :update, :show]
  before_filter :correct_user,   only: [:edit, :update, :show]

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
  
  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @course = Course.find(params[:course_id]) if params[:course_id]

    if @user.save
      session[:user_id] = @user.id
      current_user = @user
      @user.registrations.create(course: @course) if @course
      flash[:internal] = :signup
      redirect_to courses_path
    else
      render action: "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    #@user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Your details were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def logged_in_user
    if user_logged_in?
      true
    else
      redirect_to login_path(@session), notice: "Please sign in." 
      false
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
