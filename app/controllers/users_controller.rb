class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    @location = Location.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @average_rating = @user.average_rating
  end

  def create
  	user = User.new(user_params)
  	if user.save && user.valid?
       user.locations.create(longitude:params[:user][:long], latitude:params[:user][:lat])
  		session[:user_id] = user.id
  		redirect_to activities_path
  	else
      flash[:errors] = user.errors.full_messages
  		redirect_to new_user_path
  	end
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user)
  end

  def edit_preferences
    @user = current_user
    render :edit_preferences
  end

  def update_preferences
    chosen_activities = params[:name]
    if chosen_activities && params[:user]
      chosen_activities.each do |activity|
        added_activity = Activity.find_or_create_by(name: activity)
        unless current_user.activities.include?(added_activity)
          current_user.activities << added_activity
        end
      end
      current_user.update_attributes(gender_preference: params[:user][:gender_preference])
      flash[:message] = "Preferences updated successfully"
    else
      flash[:error] = "Must choose at least 1 activity/preference"
    end
    redirect_to edit_preferences_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :gender, :description, :age, :avatar)
  end


end