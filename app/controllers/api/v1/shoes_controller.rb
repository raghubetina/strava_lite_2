class Api::V1::ShoesController < Api::V1::GraphitiController
  def index
    shoes = ShoeResource.all(params)
    respond_with(shoes)
  end

  def show
    shoe = ShoeResource.find(params)
    respond_with(shoe)
  end

  def create
    shoe = ShoeResource.build(params)

    if shoe.save
      render jsonapi: shoe, status: :created
    else
      render jsonapi_errors: shoe
    end
  end

  def update
    shoe = ShoeResource.find(params)

    if shoe.update_attributes
      render jsonapi: shoe
    else
      render jsonapi_errors: shoe
    end
  end

  def destroy
    shoe = ShoeResource.find(params)

    if shoe.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: shoe
    end
  end
end
