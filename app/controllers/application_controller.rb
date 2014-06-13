class ApplicationController < ActionController::API

  before_filter :set_time_zone

  private

  def set_time_zone
    if params[:timezone] && params[:timezone].present? && params[:timezone] =~ /[A-Z][A-Z][A-Z]/
      Time.zone = Time.zone_offset(params[:timezone])
    elsif params[:timezone] && params[:timezone].present?
      Time.zone = params[:timezone]
    else
      Time.zone = "UTC"
    end
  end


end
