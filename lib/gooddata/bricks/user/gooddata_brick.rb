class GooddataBrick < Gooddata::Bricks::Brick

  def version
    "0.0.1"
  end

  def call(params={})
    pp GoodData::get('/gdc/md')
  end

end
