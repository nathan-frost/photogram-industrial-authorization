class UsersController < ApplicationController
  before_action :set_user, only: %i[show liked feed discover]
  before_action :ensure_current_user_is_user, only: %i[feed liked discover]

  def index
    @users = @q.result
  end

  def show
  end

  def feed
    # logic for @user.feed.latest already handled in view
  end

  def liked
    # logic for liked photos if needed
  end

  def discover
    # logic for discovery if needed
  end

  private

    def set_user
      @user = if params[:username]
                User.find_by!(username: params.fetch(:username))
              else
                current_user
              end
    end

    def ensure_current_user_is_user
      unless current_user == @user
        redirect_to root_path, alert: "You're not authorized for that"
      end
    end
end
