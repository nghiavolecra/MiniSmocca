class AddPropertyIdToDetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :details, :property, null: false, foreign_key: true
  end
end
