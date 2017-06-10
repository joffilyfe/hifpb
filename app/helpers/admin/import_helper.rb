module Admin::ImportHelper

  def request_suap_api(params={})

    if params[:url].nil?
      return nil
    end

    if ENV['SUAP_TOKEN'].nil?
      raise 'Please configure SUAP TOKEN'
    end

    header = {'Authorization': "Token #{ENV['SUAP_TOKEN']}"}
    uri = URI.parse(params[:url])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.request_uri, header)

    if not params[:data].nil?
      request.body = ""
      params[:data].each do |key, value|
        request.body += "#{key}=#{value}&"
      end
    end

    response = http.request(request)

    JSON.parse(response.body)
  end

end
