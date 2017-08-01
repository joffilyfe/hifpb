class AddCampusToSchoolroomsAndLaboratories < ActiveRecord::Migration[5.1]
  def change
    add_reference :schoolrooms, :campus, index: true
    add_reference :laboratories, :campus, index: true
  end
end
