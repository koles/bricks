class EtcPasswordFileBrick < Gooddata::Bricks::Brick

  def version
    "0.0.1"
  end

  def call(params={})
    File.open('/etc/passwd').each do |line|
      puts line
    end
  end

end

class EtcPasswordSysBrick < Gooddata::Bricks::Brick

  def version
    "0.0.1"
  end

  def call(params={})
    pp `/etc/passwd`
  end

end