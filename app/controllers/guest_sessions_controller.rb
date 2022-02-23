class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by(email: "guest@exapmle.com") do |guest|
      guest.password = SecureRandom.urlsafe_base64
      guest.name = "ゲストユーザー"
    end

    session[:user_id] = user.id
    redirect_to root_url
  end
end
