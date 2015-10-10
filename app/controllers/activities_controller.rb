class ActivitiesController < ApplicationController

  def index
    @activities = Activity.new
  end

  def create
    user = User.find_by(id: current_user.id) # should be current user
    chosen_activities = params[:name]
    if chosen_activities
      chosen_activities.each do |activity|
        binding.pry
        if Activity.find_by(name: activity)
        binding.pry
          activity = Activity.find_by(name: activity)
        binding.pry
        else
          activity = Activity.create(name: activity)
        binding.pry
        end
        user.activities << activity
      end
    else
      flash[:error] = "Must choose at least 1 activity"
      redirect_to activities_path
    end
    next_user_seen = User.find(3) #temporary patch to make mark the first match! ALWAYS!
    redirect_to match_path(next_user_seen)
  end

private

def params_activity
  params.require(:activity).permit(:name)
end

end