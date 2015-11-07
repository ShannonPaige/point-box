class Admin::RewardsController < Admin::BaseController

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "You successfuly created a reward!"
      redirect_to admin_path(params[:format])
    else

    end
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :point_value, :description, :user_id)
  end
end