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

  # monta o botao de paginacao
  def exibe_botao_pagina_old(prox_pagina: false, pagina: 1)
    unless prox_pagina
      return link_to '<< Página anterior', listar_deputados_path(:pagina => (pagina - 1)), :class => 'btn btn-success' if pagina > 1
    end
    if prox_pagina
      if pagina == 0
        return link_to 'Próxima página >>', listar_deputados_path(:pagina => (pagina + 2)), :class => 'btn btn-success'
      else
        return link_to 'Próxima página >>', listar_deputados_path(:pagina => (pagina + 1)), :class => 'btn btn-success'
      end
    end
  end

  def exibe_botao_pagina(url_params, prox_pagina)
    params = url_params.permit(:pagina, :nome, :sigla_uf)
    params[:pagina] = params[:pagina].to_i
    pagina_atual = params[:pagina]
    # FIXME: remover parametros vazios
    # TODO: contar a quantidade tamanho da lista com quantidade de itens e ocultar botão próxima página

    unless prox_pagina
      params[:pagina] = params[:pagina] - 1
      return link_to '<< Página anterior', listar_deputados_path(params), :class => 'btn btn-success' if pagina_atual > 1
    end
    if prox_pagina
      if pagina_atual == 0
        params[:pagina] =  2
        puts "#{params.inspect} ------------------------------------------------ "
        return link_to 'Próxima página >>', listar_deputados_path(params), :class => 'btn btn-success'
      else
        params[:pagina] = params[:pagina] + 1
        puts "#{params.inspect} ------------------------------------------------ "
        return link_to 'Próxima página >>', listar_deputados_path(params), :class => 'btn btn-success'
      end
    end
  end
end
