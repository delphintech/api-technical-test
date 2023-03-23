class ListingsController < ApplicationController
  def index
    render json: Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    json = { listing: @listing, bookings: @listing.bookings, reservations: @listing.reservations, missions: @listing.missions }
    render json: json
  end

  def create
    listing = listing.new(listing_params)
    if listing.save
      render json: {status: "SUCCESS", message: "listing was created successfully!", data: listing}, status: :created
    else
      render json: listing.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    listing = listing.find(params[:id])
    if listing.update(listing_params)
      render json: {message: "listing was updated successfully", data: listing}, status: :ok
    else
      render json: {message: "listing cannot be updated"}, status: :unprocessable_entity
    end
  end

  def destroy
    listing = listing.find(params[:id])
    if listing.destroy!
      render json: {message: "Your listing was deleted successfully"}, status: :ok
    else
      render json: {message: "This listing does not exist"}, status: :bad_request
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
