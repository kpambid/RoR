class AccomodationPhotosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :accomodation_photo_params, only: [:get_accomodation_id]
  before_action :get_accomodation_id, only: [:create]
  before_action :filter_accomodation_params, only: [:accomodation_params]

  def index
   @accomodation_photos = AccomodationPhoto.order('created_at')
 end

 def new
   @accomodation_photo = AccomodationPhoto.new
 end

 def create

   @accomodation_photo = AccomodationPhoto.new(
    photo: params[:accomodation_photo],
    accomodation_id: 1
   )
  #  binding.pry
   if @accomodation_photo.save
     flash[:success] = "The photo was added!"
     redirect_to root_path
   else
     render 'new'
   end
 end

 private

 def accomodation_photo_params
   params.permit(:image_url, :photo_file_name, :photo_content_type,
   :photo_file_size, :accomodation_id)
 end


#Unpermitted parameters: utf8, authenticity_token, accomodation_photo, commit, host_id
 def get_accomodation_id
   accomodation_photo_params[:accomodation_id] = @accomodation
 end

 # def filter_accomodation_params
 #   params.except(:utf8, :authenticity_token, :accomodation_photo, :commit, :host_id)
 # end
  # before_action :ensure_that_accomodation_photo_id_exists, only: [:destroy]
  # before_action :accomodation_photo_params, only: [:get_accomodation_id]
  # before_action :get_accomodation_id, only: [:create]
  #
  # def index
  #   @accomodation_photos = AccomodationPhoto.all
  # end
  #
  # def new
  #   @accomodation_photo = AccomodationPhoto.new
  # end
  #
  # def create
  #   new_accomodation_photo = AccomodationPhoto.create(accomodation_photo_params)
  #   render_json(new_accomodation_photo)
  # end
  #
  # def destroy
  #   deleted_accomodation_photo = @found_accomodation_photo_id.destroy
  #
  #   if deleted_accomodation_photo
  #     render json: { message: "Accomodation Photo Deleted"}
  #   end
  # end
  #
  # private
  #
  # def accomodation_photo_params
  #   params.permit(:image_url, :caption, :accomodation_id, :photo)
  # end
  #
  # def get_accomodation_id
  #   accomodation_photo_params[:accomodation_id] = @accomodation
  # end
  #
  # def ensure_that_accomodation_photo_id_exists
  #   @found_accomodation_photo_id ||= AccomodationPhoto.find_by(id: params[:id])
  #   unless @found_accomodation_photo_id
  #     render json: {message: "Accomodation Photo Id doesn't exist"}
  #   end
  # end
end
