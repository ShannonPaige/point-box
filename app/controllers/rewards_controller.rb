class RewardsController < ApplicationController

  def index
    @user = current_user
  end

  def create
    @user = current_user
    @user.rewards << Reward.find(params[:reward_id])
    # User.deduct_points(@user.id)
    # see user.rb

    latest_reward_points = @user.rewards.last.point_value
    new_points = @user.points_available - latest_reward_points
    @user.update(points_available: new_points)
    @user.points_redeemed = @user.points_redeemed + latest_reward_points

    redirect_to user_path(@user)
  end
end
