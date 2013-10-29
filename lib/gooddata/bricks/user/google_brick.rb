class GoogleBrick < Gooddata::Bricks::Brick

  def version
    "0.0.1"
  end

  def call(params={})
    pp RestClient.get('http://google.com')
  end

end
