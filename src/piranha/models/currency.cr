require "./field"

module Piranha
  module Models
    class Currency < Field
      include JSON::Serializable

      @[JSON::Field(key: "currencyCode")]
      property currency_code : String = ""
    end
  end
end