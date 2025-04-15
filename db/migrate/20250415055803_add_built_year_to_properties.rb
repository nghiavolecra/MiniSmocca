class AddBuiltYearToProperties < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :built_year, :integer
  end
end
