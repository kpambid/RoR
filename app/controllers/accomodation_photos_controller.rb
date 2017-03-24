class AccomodationPhotosController < ApplicationController
  skip_before_action :verify_authenticity_token 

  def index
    @accomodation_photos = AccomodationPhoto.all
  end

  def new
    @accomodation_photo = AccomodationPhoto.new
  end

  def create
    new_accomodation_photo = AccomodationPhoto.create(accomodation_photo_params)
  end

  private

  def accomodation_photo_params
    params.permit(:image_url, :caption, :accomodation_id)
  end

  def get_accomodation_id
    accomodation_photo_params[:accomodation_id] = @accomodation
  end
end
