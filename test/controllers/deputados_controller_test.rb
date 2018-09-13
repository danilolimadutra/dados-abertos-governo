require 'test_helper'

class DeputadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deputado = deputados(:one)
  end

  test "should get index" do
    get deputados_url
    assert_response :success
  end

  test "should get new" do
    get new_deputado_url
    assert_response :success
  end

  test "should create deputado" do
    assert_difference('Deputado.count') do
      post deputados_url, params: { deputado: { cod_dep: @deputado.cod_dep, id_legislatura: @deputado.id_legislatura, nome: @deputado.nome, sigla_partido: @deputado.sigla_partido, sigla_uf: @deputado.sigla_uf, uri: @deputado.uri, uri_partido: @deputado.uri_partido, url_foto: @deputado.url_foto } }
    end

    assert_redirected_to deputado_url(Deputado.last)
  end

  test "should show deputado" do
    get deputado_url(@deputado)
    assert_response :success
  end

  test "should get edit" do
    get edit_deputado_url(@deputado)
    assert_response :success
  end

  test "should update deputado" do
    patch deputado_url(@deputado), params: { deputado: { cod_dep: @deputado.cod_dep, id_legislatura: @deputado.id_legislatura, nome: @deputado.nome, sigla_partido: @deputado.sigla_partido, sigla_uf: @deputado.sigla_uf, uri: @deputado.uri, uri_partido: @deputado.uri_partido, url_foto: @deputado.url_foto } }
    assert_redirected_to deputado_url(@deputado)
  end

  test "should destroy deputado" do
    assert_difference('Deputado.count', -1) do
      delete deputado_url(@deputado)
    end

    assert_redirected_to deputados_url
  end
end
