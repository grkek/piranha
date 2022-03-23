module Piranha
  class Stream
    def initialize(@passbook : Models::Passbook, @manifest : Manifest)
    end

    def render(wwdr_cert : String, signing_cert : String, private_key : String, private_key_password : String)
      @manifest.validate!

      io = IO::Memory.new
      temp_file = File.tempfile { |file| file.print(@manifest.to_json) }
      signature = `openssl smime -binary -sign -certfile #{wwdr_cert} -signer #{signing_cert} -inkey #{private_key} -in #{temp_file.path} -outform DER -passin pass:#{private_key_password}`
      temp_file.delete

      Compress::Zip::Writer.open(io) do |zip|
        zip.add "pass.json", @passbook.to_json
        zip.add "manifest.json", @manifest.to_json
        zip.add "signature", signature

        @manifest.resources.each do |resource|
          zip.add resource.name, resource.content
        end
      end

      io
    end
  end
end