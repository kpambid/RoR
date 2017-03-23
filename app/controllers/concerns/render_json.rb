module RenderJson
  extend ActiveSupport::Concern
  include ValidationErrors

  included do
    attr_reader :obj
  end

  def render_json(obj)
    if obj.valid?
      render json: obj
    else
      render_422
    end
  end
end
