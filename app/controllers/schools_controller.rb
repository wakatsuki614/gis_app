class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    @review = Review.new
    @reviews = @school.reviews.includes([:user]).order(created_at: :desc)
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to root_url
    else
      flash[:danger] = 'スクール情報の登録に失敗しました。'
      redirect_to new_school_path
    end
  end

  def edit
    @school = School.find(params[:id])

    unless @school.user == current_user
      redirect_to root_url
    end
  end

  def update
    @school = School.find(params[:id])

    if current_user == @school.user
      if @school.update(school_params)
        flash[:success] = 'スクール情報を更新しました。'
        redirect_to edit_school_path
      else
        flash[:danger] = 'スクール情報の更新に失敗しました。'
        redirect_to edit_school_path
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    @school = School.find(params[:id]).destroy
    flash[:notice] = 'スクール情報を削除しました。'
    redirect_to schools_path
  end

  def search
    @schools = School.search(params[:keyword])
    @keyword = params[:keyword]
    render 'search'
  end

  private

  def school_params
    params.require(:school).permit(:user_id, :school_name, :school_email, :image, :introduce, :address, :phone, :home_page)
  end
end
