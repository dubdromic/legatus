class PlayerSound
  def sound
    @@sound ||= Gosu::Sample.new("media/start_engines.wav")
  end
end
