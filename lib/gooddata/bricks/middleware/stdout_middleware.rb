class STDOUTLoggingMiddleware < Gooddata::Bricks::Middleware

  def call(params)
    logger = Logger.new(STDOUT)
    params[:logger] = logger
    logger.info("Piepeline starting with STDOUT logger")
      @app.call(params)
    logger.info("Piepeline ending"  )
  end

end
