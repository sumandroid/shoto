class SlugsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: SlugSerializer.collection_as_array
      end
    end
  end

  def new
  end

end
