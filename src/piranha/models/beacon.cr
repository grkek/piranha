module Piranha
  module Models
    class Beacon
      include JSON::Serializable

      @[JSON::Field(key: "proximityUUID")]
      property proximity_uuid : String

      @[JSON::Field(key: "major")]
      property major : String

      @[JSON::Field(key: "minor")]
      property minor : String

      @[JSON::Field(key: "relevantText")]
      property relevant_text : String
    end
  end
end