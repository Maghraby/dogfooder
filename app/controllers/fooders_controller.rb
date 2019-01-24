class FoodersController < ApplicationController
  def create
    FooderWorker.perform_async(fooder_params)

    render json: { status: :ok }
  end

  private

  def fooder_params
    {
      actor: params.require(:actor),
      object: JSON.parse(object_params.to_json),
      timestamp: params.require(:timestamp),
    }
  end

  def object_params
    params[:object].map do |object|
      object.permit(:key, :value)
    end
  end
end
