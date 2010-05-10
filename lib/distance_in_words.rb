
class DistanceInWords
  def DistanceInWords.hash_from_seconds(seconds)
   seconds = Integer(seconds)
    distance = {
      :second => seconds % 1.minute,
      :minute => (seconds % 1.hour) / 1.minute,
      :hour => (seconds % 1.day) / 1.hour,
      :day => seconds / 1.day
    }
    
    distance.each {|key, value| distance[key] = value.floor }
    distance
  end
  
  def DistanceInWords.from_seconds_verbose(seconds)
    distance = DistanceInWords.hash_from_seconds(seconds)
    
    result = []
    [:day, :hour, :minute, :second].each {|x|
      result << I18n.t("datetime.prompts.#{x}", :count => distance[x]) if distance[x] > 0
    }
    result.to_sentence
  end
  
  def DistanceInWords.from_seconds(seconds)
    distance = DistanceInWords.hash_from_seconds(seconds)
    
    result = ""
    result << "%dd" % distance[:day] if distance[:day] > 0
    result << (distance[:day] > 0 ? "%02dh" : distance[:hour] > 0 ? "%dh" : "") % distance[:hour]
    result << "%02dm" % distance[:minute]
    result << "%02ds" % distance[:second] if distance[:second] > 0
    result
  end
end

