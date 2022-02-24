class HomesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def index
  end
end
