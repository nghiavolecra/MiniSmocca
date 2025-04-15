class AddContactPhoneToProperties < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :contact_phone, :string
  end
end
