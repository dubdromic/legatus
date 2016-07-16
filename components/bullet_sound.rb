class BulletSound
  def sound
    @@sound ||= Gosu::Sample.new("media/laser.wav")
  end
end
