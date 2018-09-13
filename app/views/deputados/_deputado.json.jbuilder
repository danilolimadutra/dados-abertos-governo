json.extract! deputado, :id, :cod_dep, :uri, :nome, :sigla_partido, :uri_partido, :sigla_uf, :id_legislatura, :url_foto, :created_at, :updated_at
json.url deputado_url(deputado, format: :json)
