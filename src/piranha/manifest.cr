module Piranha
  class Manifest
    getter resources : Array(Resource)

    def initialize(passbook : Models::Passbook)
      @passbook = passbook
      @resources = [] of Resource
    end

    def add_url(url : String)
      @resources << URLResource.new(url)
    end

    def add_file(name : String, content : String)
      @resources << FileResource.new(name: name, content: content)
    end

    def to_json
      JSON.build do |json|
        json.object do
          json.field "pass.json", Digest::SHA1.hexdigest(@passbook.to_json)

          @resources.each do |resource|
            json.field resource.name, resource.digest
          end
        end
      end
    end

    def validate!
      raise Exception.new "manifest missing required icon.png" unless valid?
    end

    def valid?
      has_icon?
    end

    def has_icon?
      @resources.any? { |resource| resource.name == "icon.png" || resource.name == "icon@2x.png" }
    end

    abstract class Resource
      def digest
        Digest::SHA1.hexdigest(content)
      end
    end

    class FileResource < Resource
      property name : String
      property content : String

      def initialize(@name, @content)
      end
    end

    class URLResource < Resource
      @response : HTTP::Client::Response?

      def initialize(url : String)
        @uri = URI.parse(url)
      end

      def name
        File.basename(@uri.path)
      end

      def response
        @response ||= get
      end

      def content
        response.body
      end

      private def get : HTTP::Client::Response
        response = HTTP::Client.get(@uri)

        unless response.success?
          raise Exception.new([response.status, response.body, response.status.description].join(", "))
        end

        response
      end
    end
  end
end
