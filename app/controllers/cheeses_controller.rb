class CheesesController < ApplicationController

  # GET /cheeses
  # def index
  #   cheeses = Cheese.all
  #   render json: cheeses
  # end

  def index
    cheeses = Cheese.all
    render json: cheeses, except: [:created_at, :updated_at]

  end

  # GET /cheeses/:id
  # def show
  #   cheese = Cheese.find_by(id: params[:id])
  #   render json: cheese
  # end

  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: {error: "Could not find"}, status: :not_found
    end
  end

end
