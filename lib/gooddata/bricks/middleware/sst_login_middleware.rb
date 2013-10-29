class GoodDataSSTLoginMiddleware < Gooddata::Bricks::Middleware

  def call(params)
    puts "Connecting to GD with SST"
    GoodData.connect_with_sst(params[:SST])
    @app.call(params)
  end

end
