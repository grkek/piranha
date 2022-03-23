module Piranha
  module Models
    class Field
      include JSON::Serializable
      include JSON::Serializable::Unmapped

      @[JSON::Field(key: "key")]
      property key : String

      @[JSON::Field(key: "value")]
      property value : String

      @[JSON::Field(key: "label")]
      property label : String = ""

      @[JSON::Field(key: "changeMessage")]
      property change_message : String = ""

      @[JSON::Field(key: "textAlignment")]
      property text_alignment : String = Constants::Alignment::LEFT
    end
  end
end