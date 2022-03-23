module Piranha
  module Models
    class Passbook
      include JSON::Serializable
      include JSON::Serializable::Unmapped

      @[JSON::Field(key: "formatVersion")]
      property format_version : Int32 = 1

      @[JSON::Field(key: "passTypeIdentifier")]
      property pass_type_identifier : String

      @[JSON::Field(key: "organizationName")]
      property organization_name : String

      @[JSON::Field(key: "serialNumber")]
      property serial_number : String

      @[JSON::Field(key: "teamIdentifier")]
      property team_identifier : String

      property description : String

      @[JSON::Field(key: "appLaunchURL")]
      property app_launch_url : String?

      @[JSON::Field(key: "associatedStoreIdentifiers")]
      property association_store_identifiers : Array(Int32)?

      @[JSON::Field(key: "userInfo")]
      property user_info : String?

      @[JSON::Field(key: "expirationDate")]
      property expiration_date : Time?

      property voided : Bool?

      @[JSON::Field(key: "beacons")]
      property beacons : Array(Beacon)?

      @[JSON::Field(key: "locations")]
      property locations : Array(Location)?

      @[JSON::Field(key: "maxDistance")]
      property max_distance : Int32?

      @[JSON::Field(key: "relevantDate")]
      property relevant_date : String?

      property barcode : Barcode?

      property barcodes : Array(Barcode)?

      @[JSON::Field(key: "backgroundColor")]
      property background_color : String?

      @[JSON::Field(key: "foregroundColor")]
      property foreground_color : String?

      # TODO - add type validation
      @[JSON::Field(key: "groupingIdentifier")]
      property grouping_identifier : String?

      @[JSON::Field(key: "labelColor")]
      property label_color : String?

      @[JSON::Field(key: "logoText")]
      property logo_text : String?

      @[JSON::Field(key: "suppressStripShine")]
      property suppress_strip_shine : Bool?

      @[JSON::Field(key: "authenticationToken")]
      property authentication_token : String?

      @[JSON::Field(key: "webServiceURL")]
      property web_service_url : String?

      @[JSON::Field(key: "eventTicket")]
      property event_ticket : Types::EventTicket

      def add_barcode(data) : Passbook
        @barcode = Barcode.from_json(data.to_json)
        self
      end
    end
  end
end
