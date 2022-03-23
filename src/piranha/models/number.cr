module Piranha
  module Models
    class Number < Field
      include JSON::Serializable

      @[JSON::Field(key: "numberStyle")]
      property number_style : String = Constants::NumberStyle::DECIMAL
    end
  end
end