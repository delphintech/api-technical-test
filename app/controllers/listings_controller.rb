class ListingsController < ApplicationController
  def index
    render json: Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    json = { listing: @listing, bookings: @listing.bookings, reservations: @listing.reservations, missions: @listing.missions }
    render json: json
  end
end
