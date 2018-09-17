module DeputadosHelper
  # Abrevia os nomes do meio
  def abrevia_nome(nome_completo)
    nomes = nome_completo.split(' ')
    tamanho = nomes.size
    nomes_meio = nomes[1..tamanho-1]

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
  def exibe_botao_pagina(prox_pagina: false, pagina: 1)
    unless prox_pagina
      return link_to '<< Página anterior', listar_deputados_path(:pagina => (pagina - 1)), :class => 'btn btn-success' if pagina > 1
    end
    if prox_pagina
      return link_to 'Próxima página >>', listar_deputados_path(:pagina => (pagina + 1)), :class => 'btn btn-success'
    end
  end
end
