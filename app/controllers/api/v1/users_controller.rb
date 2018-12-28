class Api::V1::UsersController < ApiController
  before_action :authenticate_user,   only: [:index, :show, :update]
  before_action :authorize_as_admin,  only: [:destroy]

  def index
    render json: { status: 200, msg: 'Logged in' }
  end

  def create
    user = User.new(process_params)
    if user.save
      render status: 200, json: { user: "#{user.email}", created: "Yes" }
    else 
      render status: 409, json: { user: "#{user.email}", created: "No", error: "User may already exist." }
    end
  end

  def update
    user = User.find(params[:id])
    if authorized? && user.update(process_params)
      render status: 200, json: { user: "#{user.email}", updated: "Yes" }
    else
      render status: 404, json: { error: "User with email - #{user.email} not found or is not authorized to update this account." }
    end
  end

  def destroy
    user = User.find(params[:id])

    if authorized? && user.destroy
      render json: { user: "#{user.email}", destroyed: "Yes" }, status: 200
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :location, :password, :password_confirmation)
  end

  def authorized?
    current_user.can_modify_user?(params[:id])
  end

  def process_params
    return {username: params[:user][:username], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password], city: params[:user][:location].split(', ')[0], state: params[:user][:location].split(', ')[1] }
  end
end