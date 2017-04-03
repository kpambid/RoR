class AccomodationsController < ApplicationController
  include RenderJson

  skip_before_action :verify_authenticity_token
  before_action :accomodation_params, only: [:create]
  before_action :get_host_id, only: [:create, :edit]
  before_action :find_accomodation_by_id
  before_action :ensure_that_accomodation_id_exists, only: [:destroy]

  def index
    #binding.pry
    #@accomodations = Accomodation.with_hosts.page(params[:page]).per(2)
    #@accomodations2 = Accomodation.order("name").page(params[:page]).per(2).to_sql
    #binding.pry
    @accomodations = Host.find(accomodation_params[:host_id]).accomodations.page(params[:page]).per(2)

  end

  def create
    new_accomodation = Accomodation.create(accomodation_params)
    render_json(new_accomodation)
    if new_accomodation.save
      Resque.enqueue(EmailHost, new_accomodation.id)
    end
  end

  def edit
    @accomodation.update_attributes(accomodation_params)
    render_json(@accomodation)
  end

  def destroy
    deleted_host = @found_accomodation_id.destroy
    render_json(deleted_host)
  end

  def search
    @searched_accomodation = Host.find(accomodation_params[:host_id]).accomodations.search(params[:search])
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

  def ensure_that_accomodation_id_exists
    @found_accomodation_id ||= Accomodation.find_by(id: params[:id])
    unless @found_accomodation_id
      render json: {message: "Accomodation Id doesn't exist"}
    end
  end
end
