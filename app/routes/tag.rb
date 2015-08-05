require 'cgi'
require 'json'
require 'socket'

class StockApiApp < Sinatra::Base
  # The IP address or hostname of your reader
  READER_HOSTNAME = 'speedwayr-10-e3-04.local'
  READER_PORT = 14150

  get '/api/tags/read' do
    content_type :json
    result = nil
    begin
      result = []


      # Create a TCP socket connection to the reader
      s = TCPSocket.open(READER_HOSTNAME, READER_PORT)

      started_time = Time.now
      while (Time.now < started_time + 1.seconds)
        # Read one line at a time
        line = s.gets.strip
        if !result.include?( line )
          result << line
          print line
        end
      end
      s.close
#      result = [ '340966364CB0000003A00C1B', 'E20020838205022422102D2D', 'E20020838205013626800A98', '2015052900000000000000000000ABCF',
#                 '2015052900000000000000000000ABD0', '2015052900000000000000000000ABD4', '2015052900000000000000000000ABD2',
#                 '2015052900000000000000000000ABD5', '2015052900000000000000000000ABD3', '2015052900000000000000000000ABD6' ]

#      result = [ '340966364CB0000003A00C1B', 'E20020838205022422102D2D', 'E20020838205013626800A98', '2015052900000000000000000000ABCF',
#                 '2015052900000000000000000000ABD5', '2015052900000000000000000000ABD3', '2015052900000000000000000000ABD6' ]
#      result = ['2015052900000000000000000000ABD5', '2015052900000000000000000000ABD3']

      halt 200, result.to_json
    rescue CncError => e
      halt 500, { errors: { message: e.message.to_s } }.to_json
    end
    return result.to_json
  end
end
