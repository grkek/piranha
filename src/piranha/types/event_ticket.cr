module Piranha
  module Types
    class EventTicket
      include JSON::Serializable
      include JSON::Serializable::Unmapped

      @[JSON::Field(key: "headerFields")]
      property header_fields : Array(Models::Field) = [] of Models::Field

      @[JSON::Field(key: "primaryFields")]
      property primary_fields : Array(Models::Field) = [] of Models::Field

      @[JSON::Field(key: "secondaryFields")]
      property secondary_fields : Array(Models::Field) = [] of Models::Field

      @[JSON::Field(key: "backFields")]
      property back_fields : Array(Models::Field) = [] of Models::Field

      @[JSON::Field(key: "auxiliaryFields")]
      property auxiliary_fields : Array(Models::Field) = [] of Models::Field

      def add_header_field(data) : EventTicket
        @header_fields.push(Models::Field.from_json(data.to_json))
        self
      end

      def add_primary_field(data) : EventTicket
        @primary_fields.push(Models::Field.from_json(data.to_json))
        self
      end

      def add_secondary_field(data) : EventTicket
        @secondary_fields.push(Models::Field.from_json(data.to_json))
        self
      end

      def add_back_field(data) : EventTicket
        @back_fields.push(Models::Field.from_json(data.to_json))
        self
      end

      def add_auxiliary_field(data) : EventTicket
        @auxiliary_fields.push(Models::Field.from_json(data.to_json))
        self
      end
    end
  end
end