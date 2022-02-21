class Api::V1::TypesController < Api::V1::GraphitiController
  def index
    types = TypeResource.all(params)
    respond_with(types)
  end

  def show
    type = TypeResource.find(params)
    respond_with(type)
  end

  def create
    type = TypeResource.build(params)

    if type.save
      render jsonapi: type, status: :created
    else
      render jsonapi_errors: type
    end
  end

  def update
    type = TypeResource.find(params)

    if type.update_attributes
      render jsonapi: type
    else
      render jsonapi_errors: type
    end
  end

  def destroy
    type = TypeResource.find(params)

    if type.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: type
    end
  end
end
