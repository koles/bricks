class BenchMiddleware < Gooddata::Bricks::Middleware

  def call(params)
    puts "Starting timer"
    report = Benchmark.measure { @app.call(params) }
    puts "Stopping timer"
    pp report
  end

end
