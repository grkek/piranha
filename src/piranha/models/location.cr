module Piranha
  module Models
    class Location
      include JSON::Serializable

      @[JSON::Field(key: "latitude")]
      property latitude : Float64 = 0.0

      @[JSON::Field(key: "longitude")]
      property longitude : Float64 = 0.0

      @[JSON::Field(key: "altitude")]
      property altitude : Float64 = 0.0

      @[JSON::Field(key: "distance")]
      property distance : Float64?

      @[JSON::Field(key: "relevantText")]
      property relevant_text : String = ""
    end
  end
end