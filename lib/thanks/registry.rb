require 'yaml'
require 'net/http'

module Thanks
  # Loaders for the local registry and the online version
  class Registry
    def fetch
      @remote_memoized ||= remote
    rescue SocketError => err
      STDERR.puts("Unable to contact GitHub: #{err}")
      local
    end

    def local
      @_local ||= YAML.load_file(File.join(__dir__, 'registry.yml'))
    end

    def remote
      if response.code != '200'
        STDERR.puts "Bad HTTP request: #{response.body}"
        false
      else
        YAML.safe_load(response.body.to_s)
      end
    end

    private

    def request
      Net::HTTP::Get.new(remote_uri)
    end

    def response
      Net::HTTP.start(
        remote_uri.hostname,
        remote_uri.port,
        use_ssl: true,
        timeout: 2
      ) do |http|
        http.request(request)
      end
    end

    def remote_uri
      URI('https://raw.githubusercontent.com/dpritchett/thanks-ruby/master/lib/thanks/registry.yml')
    end
  end
end
