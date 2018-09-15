# Classe para consulta na API dados abertos do governo
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

  # Faz a requisição e retorna a lista de deputados
  def deputados
    url = @base_url + '/deputados'
    request = RestClient.get(url, headers)
    retorno = JSON.parse(request.body)

    lista = []
    retorno['dados'].each do |deputado|
      lista << Deputado
    end
  end
end