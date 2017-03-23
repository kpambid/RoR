module ValidationErrors
  extend ActiveSupport::Concern

  included do
    attr_reader :obj
  end

  def render_422(obj)
    render json: { errors: obj.errors }, status: 422
  end
end
