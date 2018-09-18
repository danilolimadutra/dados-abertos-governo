# Classe para consulta na API dados abertos do governo
class DadosAbertosService
  attr_reader :base_url, :params

  def initialize(params = {})
    @base_url = 'https://dadosabertos.camara.leg.br/api/v2'
    @params = params
  end

  def headers
    {
      'Accept': 'application/json',
      'Content-type': 'application/json'
    }
  end

  # Faz a requisicao e retorna a lista de deputados
  def deputados()
    url = @base_url + '/deputados'

    # Inclui a pagina na URL
    url += '?' if @params

    @params.each do |key, value|
      url += "#{key}=#{value}&"
    end
    puts 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    puts url


    RestClient::Resource.new(url, { headers: headers } )
  end

  # Realiza o parse do request para JSON
  def parse(request)
    JSON.parse(request.body)
  end
end