module Piranha
  module Models
    class Barcode
      include JSON::Serializable

      @[JSON::Field(key: "format")]
      property format : String = Constants::BarcodeFormat::PDF417

      @[JSON::Field(key: "message")]
      property message : String = ""

      @[JSON::Field(key: "messageEncoding")]
      property message_encoding : String = "iso-8859-1"

      @[JSON::Field(key: "altText")]
      property alternative_text : String = ""
    end
  end
end