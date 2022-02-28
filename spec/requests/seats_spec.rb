require 'rails_helper'

RSpec.describe 'Seats API' , type: :request do
  # Initialize the test data
  let!(:room) { create(:room) }
  let!(:seats) { create_list(:seat, 20, room_id: room.id) }
  let(:room_id) { room.id }
  let(:seat_id) { seats.first.id }

  # Test suite for GET /rooms/:room_id/seats
  describe 'GET /rooms/:room_id/seats' do
    before { get "/rooms/#{room_id}/seats" }

    context 'when room exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all room seats' do
        expect(json.size).to eq(20)
      end
    end

    context 'when room does not exist' do
      let(:room_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Room/)
      end
    end
  end

  # Test suite for GET /rooms/:room_id/seats/:id
  describe 'GET /rooms/:room_id/seats/:id' do
    before { get "/rooms/#{room_id}/seats/#{seat_id}" }

    context 'when room seat exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the seat' do
        expect(json['id']).to eq(seat_id)
      end
    end

    context 'when room seat does not exist' do
      let(:seat_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Seat/)
      end
    end
  end

  # Test suite for PUT /rooms/:room_id/seats
  describe 'POST /rooms/:room_id/seats' do
    let(:valid_attributes) { { name: 'Visit Narnia', top: 10, left: 11, right: 12, bottom: 13 } }

    context 'when request attributes are valid' do
      before { post "/rooms/#{room_id}/seats", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/rooms/#{room_id}/seats", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /rooms/:room_id/seats/:id
  describe 'PUT /rooms/:room_id/seats/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/rooms/#{room_id}/seats/#{seat_id}", params: valid_attributes }

    context 'when seat exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the seat' do
        updated_seat = Seat.find(seat_id)
        expect(updated_seat.name).to match(/Mozart/)
      end
    end

    context 'when the seat does not exist' do
      let(:seat_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Seat/)
      end
    end
  end

  # Test suite for DELETE /rooms/:id
  describe 'DELETE /rooms/:id' do
    before { delete "/rooms/#{room_id}/seats/#{seat_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
