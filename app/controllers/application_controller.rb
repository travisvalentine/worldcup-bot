class ApplicationController < ActionController::API

  before_filter :set_time_zone

  private

  def set_time_zone
    if params[:timezone] && params[:timezone].present?
      if params[:timezone].downcase == "est"
        Time.zone = "America/New_York"
      elsif params[:timezone] =~ /[A-Z][A-Z][A-Z]/
        Time.zone = Time.zone_offset(params[:timezone])
      else
        Time.zone = params[:timezone]
      end
    else
      Time.zone = "UTC"
    end
  end


end
