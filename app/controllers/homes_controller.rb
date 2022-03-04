class HomesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def index
    @schools = School.all.limit(1).order(created_at: :desc)
  end
end
