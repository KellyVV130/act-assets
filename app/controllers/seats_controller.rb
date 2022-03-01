class SeatsController < ApplicationController
  before_action :set_room_seat, only: [:show, :update, :destroy]

  # GET /seats
  def index
    @seats = Seat.all.order :room_id
    json_response(@seats)
  end

  # GET /seats/:id
  def show
    json_response(@seat)
  end

  # POST /seats
  def create
    @seat = Seat.create!(seat_params)
    json_response(@seat, :created)
  end

  # PUT /seats/:id
  def update
    @seat.update(seat_params)
    head :no_content
  end

  # DELETE /seats/:id
  def destroy
    @seat.destroy
    head :no_content
  end

  private

  def seat_params
    params.permit(:name, :room_id, :top, :left, :right, :bottom)
  end

  def set_room_seat
    @seat = Seat.find(params[:id])
  end
end
