class BookingsController < ApplicationController
    def @booking = Booking.all
        render json: @bookings. status: :ok
    end

    def show
        render json:@booking, status: :ok
    end

    def create
        event = Event.find(params[:event_id])

        booking = event.bookings.create(
            user_id: current_user_id,
            no_of_tickets: params[:no_of_tickets].to_i

            redirect_to_event_path(event), notice: 'Your ticket has been booked'
        )
    end

    def update
        @booking.update!(booking_params)
        render json: @booking, status: :ok
    end

    def destroy
        if @booking.destroy
            render json: {}
        else
            render json: {error: "Something went wrong"}
    end

    private
    def booking_params
        params.permit(:no_of_tickets, :user_id, :event_id)
    end

    def valid_booking(valid)
        render json:{errors: valid.record.errors.full_messages}, status: :unprocessable_entity
    end

end

