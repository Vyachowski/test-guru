class BadgesController < ApplicationController
  def index
    @user_badges = current_user.badges
    @available_badges = Badge.all
  end
end
