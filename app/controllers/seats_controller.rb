class SeatsController < ApplicationController
  before_action :set_room
  before_action :set_room_seat, only: [:show, :update, :destroy]

  # GET /rooms/:room_id/seats
  def index
    json_response(@room.seats)
  end

  # GET /rooms/:room_id/seats/:id
  def show
    json_response(@seat)
  end

  # POST /rooms/:room_id/seats
  def create
    @room.seats.create!(seat_params) # 这种方式让room_id也更新了
    json_response(@room, :created)
  end

  # PUT /rooms/:room_id/seats/:id
  def update
    @seat.update(seat_params)
    head :no_content
  end

  # DELETE /rooms/:room_id/seats/:id
  def destroy
    @seat.destroy
    head :no_content
  end

  private

  def seat_params
    params.permit(:name, :top, :left, :right, :bottom)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_room_seat
    @seat = @room.seats.find_by!(id: params[:id]) if @room # TODO: has_many可以当作属性来访问？
  end
end
