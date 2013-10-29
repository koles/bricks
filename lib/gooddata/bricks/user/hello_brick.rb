class HelloWorldBrick < Gooddata::Bricks::Brick

  def version
    "0.0.1"
  end

  def call(params={})
    puts "HELLO #{params[:who].capitalize}"
  end

end
