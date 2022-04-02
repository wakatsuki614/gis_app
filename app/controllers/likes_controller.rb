class LikesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @alreadylike = Like.find_by(ip: request.remote_ip, review_id: params[:review_id])

    if @alreadylike
      redirect_back(fallback_location: root_path)
    else
      @like = Like.create(ip: request.remote_ip, review_id: params[:review_id])
      redirect_back(fallback_location: root_path)
    end
  end
end
