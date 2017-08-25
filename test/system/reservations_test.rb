require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  test "Cria reserva com sucesso" do
    visit "/admin"

    click_on "Reservas"
    click_on "Nova reserva"


    select("Sala-01",from: "schoolroom_id").select_option
    fill_in "date_reservation",with: "02/01/2014"
    click_on "Salvar"
    assert page.has_css?('div#msgsuccess')

  end
end
