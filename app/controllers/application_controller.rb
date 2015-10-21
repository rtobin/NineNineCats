class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def new
    @cat_rental_request = CatRentalRequest.new
    @cats = Cat.all
  end

  def create
    @cat_rental_request = CatRentalRequest.new
    @cats = Cat.all

    if @cat_rental_request.save
      redirect_to cats_url
    else
      render :new
    end
  end

  private

    def cat_rental_request_params
      params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end
end
