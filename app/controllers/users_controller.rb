class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = UserService.getUserByID(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @is_user_create = UserService.createUser(@user)
    if @is_user_create
      redirect_to handle_login_path,alert: "Successfully Created Your Account"
    else
      render :new
    end
  end

  def validate_login
    @user = User.find_by(email: params[:email])
    if @user == nil
      redirect_to handle_login_path, notice: "Please Create the Account"
    elsif @user.authenticate(params[:password])

      session[:user_id] = @user.id
      redirect_to posts_path
    elsif @user.password != params[:password]
      redirect_to handle_login_path, notice: "Email and Password Missmatched"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :profile, :role, :phone, :address, :dob,   :create_user_id, :updated_user_id, :deleted_user_id, :deleted_at)
    end
end
