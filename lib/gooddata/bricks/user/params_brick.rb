class ParamsBrick < Gooddata::Bricks::Brick

  def version
    "0.0.1"
  end

  def call(params={})
    pp params
  end

end
