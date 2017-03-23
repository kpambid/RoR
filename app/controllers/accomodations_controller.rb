class AccomodationsController < ApplicationController
  include RenderJson

  skip_before_action :verify_authenticity_token
  before_action :accomodation_params, only: [:create]
  before_action :get_host_id, only: [:create, :edit]
  before_action :find_accomodation_by_id
  before_action :ensure_that_user_accomodation_id_exists, only: [:destroy]

  def index
    @accomodations = Accomodation.all
  end

  def create
    new_accomodation = Accomodation.create(accomodation_params)
    render_json(new_accomodation)
  end

  def edit
    @accomodation.update_attributes(accomodation_params)
    render_json(@accomodation)
  end

  def destroy
    deleted_host = @found_accomodation_id.destroy
    render_json(deleted_host)
  end

  private

  def accomodation_params
    params.permit(:name, :location, :description, :status, :host_id)
  end

  def get_host_id
    accomodation_params[:host_id] = @host
  end

  def find_accomodation_by_id
    @accomodation = Accomodation.find_by(id: params[:id])
  end

  def ensure_that_user_accomodation_id_exists
    @found_accomodation_id ||= Accomodation.find_by(id: params[:id])
    unless @found_accomodation_id
      render json: {message: "Accomodation Id doesn't exist"}
    end
  end
end
