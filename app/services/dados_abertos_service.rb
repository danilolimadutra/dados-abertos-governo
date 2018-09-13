class DadosAbertosService
  attr_reader :base_url

  def initialize
    @base_url = 'https://dadosabertos.camara.leg.br/api/v2'
  end

  def headers
    {
      'Accept': 'application/json',
      'Content-type': 'application/json'
    }
  end

  def deputados
    url = @base_url+'/deputados'
    request = RestClient.get(url, headers)
    JSON.parse(request.body)
  end
end