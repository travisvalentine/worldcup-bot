class ApplicationController < ActionController::API

  before_filter :set_time_zone

  private

  def set_time_zone
    if params[:timezone]
      Time.zone = params[:timezone]
    else
      Time.zone = "UTC"
    end
  end

end
