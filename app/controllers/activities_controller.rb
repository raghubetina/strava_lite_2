class ActivitiesController < ApplicationController
  before_action :current_user_must_be_activity_owner,
                only: %i[edit update destroy]

  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @q = Activity.ransack(params[:q])
    @activities = @q.result(distinct: true).includes(:owner, :shoes,
                                                     :type).page(params[:page]).per(10)
  end

  def show; end

  def new
    @activity = Activity.new
  end

  def edit; end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      message = "Activity was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @activity, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @activity.update(activity_params)
      redirect_to @activity, notice: "Activity was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    message = "Activity was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to activities_url, notice: message
    end
  end

  private

  def current_user_must_be_activity_owner
    set_activity
    unless current_user == @activity.owner
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:created_by, :activity_type, :photo,
                                     :distance, :calories, :shoes_used)
  end
end
