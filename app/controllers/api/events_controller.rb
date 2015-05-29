class Api::EventsController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def create
    puts request.env['HTTP_ORIGIN'].inspect
    # app = App.find_by(url: request.env['HTTP_ORIGIN'])
    # puts "*" * 10 
    # puts app.inspect
    # raise
    # event = app.events.build(event_params)
    # if app.nil?
    #   render json: "Unregistered application", status: :unprocessable_entity
    # elsif event.save
    #   render json: @event, status: :created
    # else
    #   render @event.errors, status: :unprocessable_entity
    # end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:name)
  end
end