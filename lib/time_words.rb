module ActiveSupport
  module CoreExtensions
    module Numeric
      module Conversions

        def seconds_to_time_hash
          seconds = self.respond_to?("to_i") && (self > 0) ? self.to_i : 0
          {
            :second => seconds % 1.minute,
            :minute => (seconds % 1.hour) / 1.minute,
            :hour => (seconds % 1.day) / 1.hour,
            :day => seconds / 1.day
          }.each {|key, value| value = value.floor }
        end
        
        def seconds_to_long_words
          hash = self.seconds_to_time_hash
          hash.delete_if {|key, value| value == 0}
          
          hash.each do |key, value|
            hash[key] = I18n.t "datetime.distance_in_words.#{key}", :count => value
          end
          
          ordered_time_components = []
          [:day, :hour, :minute, :second].each do |x|
            ordered_time_components << hash[x] if hash[x]
          end
          ordered_time_components.to_sentence
        end
        
        def seconds_to_short_words
          hash = self.seconds_to_time_hash
          hash.delete_if {|key, value| value == 0}
          
          result = ""
          result << "%dd" % hash[:day] if hash[:day]
          result << (hash[:day] ? "%02dh" : "%dh") % hash[:hour] if hash[:hour]
          result << "%02dm" % hash[:minute]
          result << "%02ds" % hash[:second] if hash[:second]
          result
        end
      end
    end
  end
end

