require "./field"

module Piranha
  module Models
    class Date < Field
      include JSON::Serializable

      @[JSON::Field(key: "dateStyle")]
      property date_style : String = Constants::DateStyle::SHORT

      @[JSON::Field(key: "timeStyle")]
      property time_style : String = Constants::DateStyle::SHORT

      @[JSON::Field(key: "isRelative")]
      property is_relative : Bool = false
    end
  end
end