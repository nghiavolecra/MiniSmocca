class CreateContactRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_requests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :appointment_date
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
