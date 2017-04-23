class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :address
      t.string :phone
      t.string :email
      t.string :notes

      t.timestamps
    end
  end
end
