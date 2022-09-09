require 'net/http'
require 'uri'
require 'json'

module LogFormatter
  class << self
    def format_log
      uri = URI.parse('https://samples.jnito.com/access-log.json')
      json = Net::HTTP.get(uri)
      log = JSON.parse(json, symbolize_names: true)
      log.map do |l|
        case l
        in {request_id:, path:, status: 404 | 500 => status, error:}
          "[ERROR] request_id=#{request_id}, path=#{path}, status=#{status}, error=#{error}"
        in {request_id:, path:, duration: 1000.. => duration}
          "[WARN] request_id=#{request_id}, path=#{path}, duration=#{duration}"
        in {request_id:, path:}
          "[OK] request_id=#{request_id}, path=#{path}"
        end
      end.join("\n")
    end
  end
end
