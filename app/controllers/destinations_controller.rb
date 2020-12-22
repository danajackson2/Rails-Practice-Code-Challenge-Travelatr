class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params[:id])
        @five = @destination.five_most_recent
    end

end