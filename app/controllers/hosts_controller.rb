class HostsController < ApplicationController
  include RenderJson

  skip_before_action :verify_authenticity_token
  before_action :ensure_that_user_host_id_exists, only: [:destroy]
  before_action :find_host_by_id, only: [:create, :edit]

  def index
    @hosts = Host.all
  end

  def new
    new_host = Host.new
  end

  def create
    new_host = Host.create(host_params)
    render_json(new_host)
  end

  def edit
    @host.update_attributes(host_params)
    render_json(@host)
  end

  def destroy
    deleted_host = @found_host_id.destroy

    if deleted_host
      render json: { message: "Host Deleted" }
    end
  end

  private

  def host_params
    params.permit(:email, :password, :first_name, :last_name, :location, :image_url)
  end

  def find_host_by_id
    @host = Host.find_by(id: params[:id])
  end

  def ensure_that_user_host_id_exists
    @found_host_id ||= Host.find_by(id: params[:id])
    unless @found_host_id
      render json: {message: "Host Id doesn't exist"}
    end
  end

end
