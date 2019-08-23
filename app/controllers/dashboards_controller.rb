class DashboardsController < ApplicationController
  def show
    @user_events = current_user.user_events
    @fav_sport = current_user.favorite_sports
    day_order = %w(monday tuesday wednesday thursday friday saturday sunday)
    @availabilities = current_user.availabilities.reject { |availability| availability.slots.all?(false) }.sort_by{|day| day_order.index(day.day_name)}
  end
end