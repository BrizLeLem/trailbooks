class TrailsController < ApplicationController
  before_action :set_trail, only: %i[show]

  def show
    @markers = @trail.accomodations.map do |accomodation|
      icon = assign_icon(accomodation.category)
      {
        lat: accomodation.latitude,
        lng: accomodation.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { accomodation: accomodation }),
        image_url: helpers.asset_url(icon)
      }
    end
  end
  # To Do: create and add markers for trail stages to @markers

  private

  def set_trail
    @trail = Trail.find(params[:id])
  end

  def assign_icon(category)
    if category == "Hut"
      'marker-enabled-hut.png'
    elsif category == "Campsite"
      'marker-enabled-campsite.png'
    end
  end
end
