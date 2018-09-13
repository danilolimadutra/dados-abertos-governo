require "application_system_test_case"

class DeputadosTest < ApplicationSystemTestCase
  setup do
    @deputado = deputados(:one)
  end

  test "visiting the index" do
    visit deputados_url
    assert_selector "h1", text: "Deputados"
  end

  test "creating a Deputado" do
    visit deputados_url
    click_on "New Deputado"

    fill_in "Cod Dep", with: @deputado.cod_dep
    fill_in "Id Legislatura", with: @deputado.id_legislatura
    fill_in "Nome", with: @deputado.nome
    fill_in "Sigla Partido", with: @deputado.sigla_partido
    fill_in "Sigla Uf", with: @deputado.sigla_uf
    fill_in "Uri", with: @deputado.uri
    fill_in "Uri Partido", with: @deputado.uri_partido
    fill_in "Url Foto", with: @deputado.url_foto
    click_on "Create Deputado"

    assert_text "Deputado was successfully created"
    click_on "Back"
  end

  test "updating a Deputado" do
    visit deputados_url
    click_on "Edit", match: :first

    fill_in "Cod Dep", with: @deputado.cod_dep
    fill_in "Id Legislatura", with: @deputado.id_legislatura
    fill_in "Nome", with: @deputado.nome
    fill_in "Sigla Partido", with: @deputado.sigla_partido
    fill_in "Sigla Uf", with: @deputado.sigla_uf
    fill_in "Uri", with: @deputado.uri
    fill_in "Uri Partido", with: @deputado.uri_partido
    fill_in "Url Foto", with: @deputado.url_foto
    click_on "Update Deputado"

    assert_text "Deputado was successfully updated"
    click_on "Back"
  end

  test "destroying a Deputado" do
    visit deputados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deputado was successfully destroyed"
  end
end
