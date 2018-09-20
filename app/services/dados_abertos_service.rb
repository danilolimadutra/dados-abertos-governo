# Classe para consulta na API dados abertos do governo
class DadosAbertosService
  attr_reader :base_url, :params
  QTD_ITEM = 18

  def initialize(params)
    @base_url = 'https://dadosabertos.camara.leg.br/api/v2'
    @params = params
    @params[:itens] = QTD_ITEM unless @params[:itens]
  end

  def headers
    {
      'Accept': 'application/json',
      'Content-type': 'application/json'
    }
  end

  # Faz a requisicao e retorna a lista de deputados
  def deputados
    url = @base_url + '/deputados'

    # Inclui a pagina na URL
    url += '?' if @params.size > 0

    @params.each do |key, value|
      url += "#{key}=#{value}&" if value != ''
    end
    
    RestClient::Resource.new(url, { headers: headers } )
  end

  # verifica se existe item na proxima pagina para poder carregar o botao
  def proxima_pagina(qtd_lista)
    if qtd_lista == QTD_ITEM
      @params[:itens] = 1
      @params[:pagina] = @params[:pagina].to_i + 1
      request = deputados.get
      resource = parse(request)
      @lista = resource['dados']
      @lista.size ? true : false
    end
  end

  # Realiza o parse do request para JSON
  def parse(request)
    JSON.parse(request.body)
  end
end