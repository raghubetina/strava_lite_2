class ShoesController < ApplicationController
  before_action :set_shoe, only: %i[show edit update destroy]

  def index
    @q = Shoe.ransack(params[:q])
    @shoes = @q.result(distinct: true).includes(:activities).page(params[:page]).per(10)
  end

  def show
    @activity = Activity.new
  end

  def new
    @shoe = Shoe.new
  end

  def edit; end

  def create
    @shoe = Shoe.new(shoe_params)

    if @shoe.save
      redirect_to @shoe, notice: "Shoe was successfully created."
    else
      render :new
    end
  end

  def update
    if @shoe.update(shoe_params)
      redirect_to @shoe, notice: "Shoe was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @shoe.destroy
    redirect_to shoes_url, notice: "Shoe was successfully destroyed."
  end

  private

  def set_shoe
    @shoe = Shoe.find(params[:id])
  end

  def shoe_params
    params.require(:shoe).permit(:owner, :name, :make, :model)
  end
end
