class CatRentalRequestsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def cat_rental_params
      params.require(:cat_rental_requests)
        .permit(:cat_id, :start_date, :end_date, :status)
    end

end
