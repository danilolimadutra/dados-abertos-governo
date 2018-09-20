module DeputadosHelper
  # Abrevia os nomes do meio
  def abrevia_nome(nome_completo)
    nomes = nome_completo.split(' ')
    tamanho = nomes.size
    nomes_meio = []

    nomes_meio = nomes[1..tamanho - 2] if tamanho > 2

    nome_abrev = nomes.first

    nomes_meio.each do |nome|
      nome_abrev += ' ' + nome[0] + '.'
    end

    nome_abrev += ' ' + nomes.last
  end

  # Grid para ajustar o array a quantidade de colunas necessarias para montar a grid de impressao
  def ajusta_grid(lista, qtd_col)
    grid = []
    grid_line = []
    count = 0

    lista.each do |item|
      # monta a grid_line
      if count < qtd_col
        grid_line << item
        count += 1
      end

      # Armazena grid_line em grid
      if count == qtd_col
        grid << grid_line.map(&:clone)
        grid_line = []
        count = 0
      end
    end

    grid << grid_line.map(&:clone) if grid_line.size
  end

  # Monta os botoes de paginacao
  def exibe_botao_pagina(url_params, prox_pagina)
    params = url_params.permit(:pagina, :nome, :sigla_uf, :itens, :ordenar_por)
    params[:pagina] = params[:pagina].to_i
    pagina_atual = params[:pagina]
    # TODO: contar a quantidade tamanho da lista com quantidade de itens e ocultar botão próxima página
    # remove valores vazios
    params.delete_if { |_, v| v.nil? || v == '' }

    if prox_pagina == false && pagina_atual > 1
      params[:pagina] = params[:pagina] - 1
      return link_to '<< Página anterior', listar_deputados_path(params), :class => 'btn btn-success' 
    end
    if prox_pagina
      if pagina_atual.zero?
        params[:pagina] = 2
      else
        params[:pagina] = params[:pagina] + 1
      end
      return link_to 'Próxima página >>', listar_deputados_path(params), :class => 'btn btn-success'
    end
  end
end
