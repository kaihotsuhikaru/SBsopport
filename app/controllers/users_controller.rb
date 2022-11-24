class UsersController < ApplicationController
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    tasks_root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def index
    @users = User.all
    @users = User.page(params[:page]).per(15)
    @users_total = User.count
  end

  def show
    @user = User.find(params[:id])
    #@completed_tasks = @user.completed_tasks
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def followings
    @user  = User.find(params[:user_id])
    @title = @user.name + " さんがフォロー中"
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:user_id])
    @title = @user.name + " さんをフォロー中"
    @users = @user.followers
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image,)
  end
end
